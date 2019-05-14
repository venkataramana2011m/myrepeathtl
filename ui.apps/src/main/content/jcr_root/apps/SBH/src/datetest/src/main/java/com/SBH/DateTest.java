package com.SBH;

import java.text.SimpleDateFormat;
import java.util.Date;

public class DateTest {

	public String dateDiff(String startdt, String enddt) {

		String dateStart = startdt;
		String dateEnd = enddt;
		String dd = "";
		//HH converts hour in 24 hours format (0-23), day calculation
		SimpleDateFormat format = new SimpleDateFormat("MM/dd/yyyy");

		Date d1 = null;
		Date d2 = null;
 
		try {
			d1 = format.parse(dateStart);
			d2 = format.parse(dateEnd);
 

			long diff = d2.getTime() - d1.getTime();
			long diffDays = diff / (24 * 60 * 60 * 1000);
			dd = String.valueOf(diffDays);
 
		} catch (Exception e) {
			e.printStackTrace();
		}
        return dd;

	}
 
}
