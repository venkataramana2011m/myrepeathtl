package com.SBH;


import java.util.Date;
import java.util.Locale;
import java.util.Calendar;
import java.text.DateFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;


public class ChangeDateFormat {

	public String changeDtFormat(String dt) {

		String dateInString = dt;
		String modifiedDate = "";

		String[] SplitDateDL = dt.split("/");
        for (String str : SplitDateDL) {
				System.out.println(str);
			}
		SimpleDateFormat formatter = new SimpleDateFormat("dd/MM/yyyy");

        try {
     
            Date date = formatter.parse(dateInString);
            System.out.println(date);
            modifiedDate=formatter.format(date);
            

        } catch (Exception e) {
            e.printStackTrace();
        }
        return modifiedDate;

	}
 
}
