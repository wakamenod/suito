package services

import "github.com/wakamenod/suito/model"

func (s *SuitoTransactionScheduleService) ListTransactionSchedulesService(uid string) ([]TransactionSchedule, []TransactionSchedule, error) {
	expenses, err := s.expenseScheduleRepo.FindExpenseSchedules(uid)
	if err != nil {
		return nil, nil, err
	}
	incomes, err := s.incomeScheduleRepo.FindIncomeSchedules(uid)
	if err != nil {
		return nil, nil, err
	}
	incomeTypes, err := s.incomeTypeRepo.FindIncomeTypes(uid)
	if err != nil {
		return nil, nil, err
	}
	incomeTypeMap := make(map[string]model.IncomeType)
	for _, incomeType := range incomeTypes {
		incomeTypeMap[incomeType.ID] = incomeType
	}

	resExpenses := make([]TransactionSchedule, len(expenses))
	for i, ex := range expenses {
		resExpenses[i] = TransactionSchedule{
			ID:     ex.ID,
			Title:  ex.Title,
			Amount: ex.Amount,
		}
	}

	resIncomes := make([]TransactionSchedule, len(incomes))
	for i, in := range incomes {
		resIncomes[i] = TransactionSchedule{
			ID:     in.ID,
			Title:  incomeTypeMap[in.IncomeTypeID].Name,
			Amount: in.Amount,
		}
	}

	return resExpenses, resIncomes, nil
}
