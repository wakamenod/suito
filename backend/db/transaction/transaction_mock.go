// Code generated by moq; DO NOT EDIT.
// github.com/matryer/moq

package transaction

import (
	"sync"
)

// Ensure, that ProviderMock does implement Provider.
// If this is not the case, regenerate this file with moq.
var _ Provider = &ProviderMock{}

// ProviderMock is a mock implementation of Provider.
//
//	func TestSomethingThatUsesProvider(t *testing.T) {
//
//		// make and configure a mocked Provider
//		mockedProvider := &ProviderMock{
//			TransactionFunc: func(fc func() error, handlers ...TransactionHandler) error {
//				panic("mock out the Transaction method")
//			},
//		}
//
//		// use mockedProvider in code that requires Provider
//		// and then make assertions.
//
//	}
type ProviderMock struct {
	// TransactionFunc mocks the Transaction method.
	TransactionFunc func(fc func() error, handlers ...TransactionHandler) error

	// calls tracks calls to the methods.
	calls struct {
		// Transaction holds details about calls to the Transaction method.
		Transaction []struct {
			// Fc is the fc argument value.
			Fc func() error
			// Handlers is the handlers argument value.
			Handlers []TransactionHandler
		}
	}
	lockTransaction sync.RWMutex
}

// Transaction calls TransactionFunc.
func (mock *ProviderMock) Transaction(fc func() error, handlers ...TransactionHandler) error {
	if mock.TransactionFunc == nil {
		panic("ProviderMock.TransactionFunc: method is nil but Provider.Transaction was just called")
	}
	callInfo := struct {
		Fc       func() error
		Handlers []TransactionHandler
	}{
		Fc:       fc,
		Handlers: handlers,
	}
	mock.lockTransaction.Lock()
	mock.calls.Transaction = append(mock.calls.Transaction, callInfo)
	mock.lockTransaction.Unlock()
	return mock.TransactionFunc(fc, handlers...)
}

// TransactionCalls gets all the calls that were made to Transaction.
// Check the length with:
//
//	len(mockedProvider.TransactionCalls())
func (mock *ProviderMock) TransactionCalls() []struct {
	Fc       func() error
	Handlers []TransactionHandler
} {
	var calls []struct {
		Fc       func() error
		Handlers []TransactionHandler
	}
	mock.lockTransaction.RLock()
	calls = mock.calls.Transaction
	mock.lockTransaction.RUnlock()
	return calls
}
