package com.service;

import java.sql.Connection;
import java.util.List;

import org.springframework.stereotype.Service;

import com.model.Cities;
import com.model.Country;
import com.model.State;
@Service
public interface DropDownService {
	
		public List<Country> getAllCountry();
		public List<State> getStateByCountryId(String countryId);
		public List<Cities> getCityByStateId(String stateId);
		public void conn(Connection con);
		List<String> getCountries();
		List<String> getStates(String country);
		List<String> getCities(String state);
}
