/**
 * 
 */
package com.communities.aem.core.constants;

/**
 * @author pavan.kumar.manda
 *
 */
public class MyToolConstants {
	/**
	 * Instantiates a new constants.
	 */
	public MyToolConstants() {
		/**
		 * Empty constructor defined.
		 */
	}
	/** Constant for REGULAR EXPRESSION FOR DOB*/
	public static final String MYDATE_REGEX = "";
	
	/** Constant for REGULAR EXPRESSION FOR NAME*/
	public static final String MYNAME_REGEX = "\\w{26}";
	
	/** Constant for REGULAR EXPRESSION FOR ADDRESS*/
	public static final String MYADDRS_REGEX = "\\d+\\s+(([a-zA-Z])+|([a-zA-Z]+\\s+[a-zA-Z]+))\\s+[a-zA-Z]*";
	
	/** Constant for REGULAR EXPRESSION FOR PHONE NUMBER*/
	public static final String MYPHONENO_REGEX = "";
	
	/** Constant for REGULAR EXPRESSION FOR EMAILID*/
	public static final String MYEMAILID_REGEX = "^[_A-Za-z0-9-\\+]+(\\.[_A-Za-z0-9-]+)*@[A-Za-z0-9-]+(\\.[A-Za-z0-9]+)*(\\.[A-Za-z]{2,})$";
	
	/** Constant for REGULAR EXPRESSION FOR POSTCODE*/
	public static final String MYPOSTCODE_REGEX = "\\d{6}";
	
	/** Constant for REGULAR EXPRESSION FOR EMPLOYEE CODE*/
	public static final String MYEMPCODE_REGEX = "\\d{8}";
}
