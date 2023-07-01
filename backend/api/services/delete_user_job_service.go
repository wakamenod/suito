package services

import (
	"context"

	"github.com/pkg/errors"
	"github.com/wakamenod/suito/client"
	"github.com/wakamenod/suito/log"
	"google.golang.org/api/iterator"
)

func (s *SuitoDeleteUserJobService) DeleteUsersJobService() error {
	firebaseUsers, err := fetchFirebaseUsers(s.authClient)
	if err != nil {
		log.Warn("err fetchFirebaseUsers", log.Fields{"err": err})
		return errors.Wrap(err, "err fetchFirebaseUsers")
	}
	uids, err := s.userRepo.FindAllUIDs()
	if err != nil {
		return errors.Wrap(err, "err FindAllUIDs")
	}

	nonExistentUIDs := getNonExistentUsersIDs(uids, firebaseUsers)

	log.Info("delete user targets", log.Fields{"uids": nonExistentUIDs})

	err = s.Transaction(func() error {
		if err := s.deleteAllUserData(nonExistentUIDs); err != nil {
			return errors.Wrap(err, "err deleteAllUserData")
		}
		return nil
	}, s.expenseCategoryRepo, s.expenseLocationRepo, s.incomeRepo, s.expenseRepo, s.userRepo)
	if err != nil {
		log.Warn("err delete user data", log.Fields{"err": err})
		return err
	}

	return nil
}

func (s *SuitoDeleteUserJobService) deleteAllUserData(uids []string) error {
	for _, uid := range uids {
		if err := s.expenseCategoryRepo.HardDeleteAllUserExpenseCategories(uid); err != nil {
			return err
		}
		if err := s.expenseLocationRepo.HardDeleteAllUserExpenseLocations(uid); err != nil {
			return err
		}
		if err := s.expenseRepo.HardDeleteAllUserExpenses(uid); err != nil {
			return err
		}
		if err := s.incomeRepo.HardDeleteAllUserIncomes(uid); err != nil {
			return err
		}
		if err := s.userRepo.DeleteUsers([]string{uid}); err != nil {
			return err
		}
	}

	return nil
}

func getNonExistentUsersIDs(uuids []string, firebaseUsers map[string]bool) []string {
	nonExistentUsers := make([]string, 0)
	for _, uuid := range uuids {
		if _, ok := firebaseUsers[uuid]; !ok {
			nonExistentUsers = append(nonExistentUsers, uuid)
		}
	}
	return nonExistentUsers
}

// firebase登録済みのユーザーIDをマップのキーとして返却
func fetchFirebaseUsers(authClient client.AuthClient) (map[string]bool, error) {
	ctx := context.Background()
	userIDs := make(map[string]bool)

	iter := authClient.Users(ctx, "")
	for {
		user, err := iter.Next()
		if err == iterator.Done {
			break
		}
		if err != nil {
			return nil, errors.Wrap(err, "error listing users")
		}

		userIDs[user.UID] = true
	}

	return userIDs, nil
}
