package services

func (s *SuitoTransactionScheduleService) ListTransactionSchedulesService(uid string) ([]TransactionSchedule, []TransactionSchedule, error) {
	expenses, err := s.expenseScheduleRepo.FindExpenseSchedules(uid)
	if err != nil {
		return nil, nil, err
	}
	incomes, err := s.incomeScheduleRepo.FindIncomeSchedules(uid)
	if err != nil {
		return nil, nil, err
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
			Title:  in.IncomeType.Name,
			Amount: in.Amount,
		}
	}

	return resExpenses, resIncomes, nil
}
