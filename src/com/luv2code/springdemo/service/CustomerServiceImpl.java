package com.luv2code.springdemo.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.luv2code.springdemo.dao.CustomerDAO;
import com.luv2code.springdemo.entity.Customer;

@Service
public class CustomerServiceImpl implements CustomerService {

	// need to inject customer dao
	@Autowired //spring will scan for a component that implements CustomerDAO interface. dependency injection con java reflection. se ho piu
	//di una classe che implementa quella interfaccia devo utilizzare anche l'annotazione @Qualifier con la specifica della classe che voglio
	private CustomerDAO customerDAO;
	
	@Override
	@Transactional //questa annotazione permette al nostro codice senza scrivere nulla di iniziare e finire una transazione nel db.
	public List<Customer> getCustomers() {
		return customerDAO.getCustomers();
	}

	@Override
	@Transactional
	public void saveCustomer(Customer theCustomer) {
		// TODO Auto-generated method stub
		customerDAO.saveCustomer(theCustomer);
	}
}





