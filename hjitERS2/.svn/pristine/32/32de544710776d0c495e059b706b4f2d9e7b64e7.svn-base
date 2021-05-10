package kr.co.hjitERS.util;

import java.io.IOException;
import java.io.PrintWriter;
import java.text.DecimalFormat;
import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;

import javax.servlet.http.HttpServletResponse;

public class FormatUtil {
	public static String bizRegiNoFormat(String bizRegiNo) {
		return bizRegiNo.length() != 10
				? bizRegiNo
				: bizRegiNo.substring(0, 3) + "-" + bizRegiNo.substring(3, 5) + "-" + bizRegiNo.substring(5, 10);
	}

	public static String nvl(String source, String target) {
		return source != null ? source : target;
	}

	public static String nvl2(String source, String target) {
		return source != null && !source.equals("") ? source : target;
	}

	public static String nvl3(String source, String target) {
		return source != null && !source.trim().equals("") ? source : target;
	}

	public static String nvlSubstr(String source, int from, int to, String target) {
		try {
			return source.substring(from, to);
		} catch (Exception arg4) {
			return target;
		}
	}

	public static String makeQuot(String source) {
		return "\'" + nvl2(source, "") + "\'";
	}

	public static String juminNo(String juminno) {
		int juminno_len = juminno.length();
		String retValue = "";
		if (juminno_len == 13) {
			retValue = juminno.substring(0, 6) + "-" + juminno.substring(6, 13);
		} else {
			retValue = juminno;
		}

		return retValue;
	}

	public static String[] dateArr(String datestr) {
		String[] tmp = new String[]{"", "", ""};
		if (datestr != null && datestr.length() == 8) {
			tmp[0] = datestr.substring(0, 4);
			tmp[1] = datestr.substring(4, 6);
			tmp[2] = datestr.substring(6, 8);
		}

		return tmp;
	}

	public static String[] zipArr(String zipstr) {
		String[] tmp = new String[]{"", ""};
		if (zipstr != null && zipstr.length() == 6) {
			tmp[0] = zipstr.substring(0, 3);
			tmp[1] = zipstr.substring(3, 6);
		}

		return tmp;
	}

	public static String replace(String sourceStr, String source, String target) {
		String result = sourceStr;
		int idx = sourceStr.indexOf(source);
		if (idx > -1) {
			result = sourceStr.substring(0, idx) + target
					+ sourceStr.substring(idx + source.length(), sourceStr.length());
			result = replace(result, source, target);
		}

		return result;
	}
	
	public static String replace1(String inString, String oldPattern, String newPattern) {
		if (inString == null) {
			return null;
		} else if (oldPattern != null && newPattern != null) {
			StringBuffer sbuf = new StringBuffer();
			int pos = 0;
			int index = inString.indexOf(oldPattern);

			for (int patLen = oldPattern.length(); index >= 0; index = inString.indexOf(oldPattern, pos)) {
				sbuf.append(inString.substring(pos, index));
				sbuf.append(newPattern);
				pos = index + patLen;
			}

			sbuf.append(inString.substring(pos));
			return sbuf.toString();
		} else {
			return inString;
		}
	}

	public static Object pcsFormat(String pNumber) {
		String pcsNumber = replace(pNumber.trim(), "-", "");
		String retValue = "";
		int len = pcsNumber.length();
		if (len >= 10) {
			retValue = pcsNumber.substring(0, 3) + "-" + pcsNumber.substring(3, len - 4) + "-"
					+ pcsNumber.substring(len - 4);
		} else {
			retValue = pcsNumber;
		}

		return retValue;
	}

	public static String insertComma(String inputStr) {
		String tmpStr = inputStr;
		String underComma = "";
		if (inputStr.indexOf(".") >= 0) {
			tmpStr = inputStr.substring(0, inputStr.indexOf("."));
			underComma = "." + inputStr.substring(inputStr.indexOf(".") + 1);
		}

		int len = tmpStr.length();
		String resultValue = "";
		String sign = "";
		if (inputStr.startsWith("-")) {
			sign = "-";
			--len;
			tmpStr = tmpStr.substring(1);
		}

		for (int i = 0; i < len; ++i) {
			if (i > 0 && i % 3 == 0) {
				resultValue = "," + resultValue;
			}

			resultValue = tmpStr.charAt(len - 1 - i) + resultValue;
		}

		return sign + resultValue + underComma;
	}

	public static String insertComma2(String inputStr) {
		String resultValue = insertComma(inputStr);
		resultValue = resultValue.equals("0") ? "" : resultValue;
		return resultValue;
	}

	public static String fillZero(String source, int length) {
		if (source == null) {
			return "";
		} else if (source.length() >= length) {
			return source;
		} else {
			while (source.length() < length) {
				source = "0" + source;
			}

			return source;
		}
	}

	public static String zeroToEmpty(String value) {
		return value.equals("0") ? "" : value;
	}

	public static String emptyToZero(String value) {
		return value.equals("") ? "0" : value;
	}

	public static String iifEQ(String src1, String src2, String target1, String target2) {
		try {
			return src1.equals(src2) ? target1 : target2;
		} catch (Exception arg4) {
			return target2;
		}
	}
	
	public static String Left(String pValue, int len){
        if( pValue == null){
            pValue = "";
        }else if(pValue.length() >= len){
            pValue = pValue.substring(0, len);
        }

        return pValue;
    }
	
	public static String Right(String pValue, int len){
        if( pValue == null){
            pValue = "";
        }else if(pValue.length() >= len){
            pValue = pValue.substring(pValue.length()-len);
        }

        return pValue;
    }

    public static String formatStr(String pSource, String pFormat){
        return formatStr(pSource, pFormat, false);
    }
    
	public static String formatStr(String pSource, String pFmt, boolean pMustFormat){
        String rValue = "";

        pSource = pSource == null ? "":pSource;
        pFmt = pFmt == null ? "":pFmt;
        pFmt = pFmt.trim().toLowerCase();

        if(pFmt.equals("jumin") || pFmt.equals("주민") || pFmt.equals("주민번호") || pFmt.equals("bubin") || pFmt.equals("법인") || pFmt.equals("법인번호") ){
            if(!pMustFormat && pSource.length() != 13 )
                rValue = pSource;
            else
                rValue = pSource.substring(0,6) + "-" + pSource.substring(6);
        }else if(pFmt.equals("sano") || pFmt.equals("sa") || pFmt.equals("bizno") || pFmt.equals("bubin") || pFmt.equals("사업자") || pFmt.equals("사업자번호") ){
            if(!pMustFormat && pSource.length() != 10 )
                rValue = pSource;
            else
                rValue = pSource.substring(0,3) + "-" + pSource.substring(3,5) + "-" + pSource.substring(5);
        }else if(pFmt.equals("yyyy-mm-dd")){
            if(!pMustFormat && pSource.length() < 8  )
                rValue = pSource;
            else
                rValue = pSource.substring(0,4) + "-" + pSource.substring(4,6) + "-" + pSource.substring(6,8);
        }else if(pFmt.equals("yyyy년mm월dd일")){
            if(!pMustFormat && pSource.length() < 8  )
                rValue = pSource;
            else
                rValue = pSource.substring(0,4) + "년 " + getInt(pSource.substring(4,6)) + "월 " + getInt(pSource.substring(6,8))+"일";
        }else if(pFmt.equals("post")){
            if(!pMustFormat && pSource.length() < 6  )
                rValue = pSource;
            else
                rValue = pSource.substring(0,3) + "-" + pSource.substring(3);
        }else if(pFmt.equals("yyyy-mm")){
            if(!pMustFormat && pSource.length() < 6  )
                rValue = pSource;
            else
                rValue = pSource.substring(0,4) + "-" + pSource.substring(4,6);
        }else{

            int i, kk = 0, si = 0;
            StringBuffer tStr = new StringBuffer();

            kk = 0;
            for(i = 0; i < pFmt.length(); i+=2){
                si += toInt(pFmt.substring(i,i+1),0);
                if(pSource.length() >= si ){
                    tStr.append(pSource.substring(kk,si));
                }else{
                    tStr.append(pSource.substring(kk));
                }

                if(i < pFmt.length() - 1 )
                    tStr.append(pFmt.substring(i+1,i+2));

                kk = si;
                if(pSource.length() < kk)
                    break;
            }

            if(!pMustFormat && pSource.length() < kk - 1)
                rValue = pSource;
            else
                rValue = tStr.toString();

        }

        return rValue;
    }

    public static String getNum(int pValue){
        return pValue + "";
    }
    
	public static String getNum(String pValue){
        String rValue = "0";
        StringBuffer sb = new StringBuffer();

        if(pValue != null){
            for(int i=0;i<pValue.length();i++){
                if("-0123456789.".indexOf(pValue.substring(i,i+1)) >= 0){
                    sb.append(pValue.substring(i,i+1));
                }
            }

            rValue = sb.toString();
            if(pValue.indexOf("(") == 0){//괄호가 쳐져 있는 경우는 -(마이너스)로 인식한다.
                rValue = "-" + rValue;
            }
        }

        return rValue.equals("") ? "0" : rValue;
    }
	
	public static int getInt(String pValue){
	        String v = getNum(pValue);
	        
	        DecimalFormat df_u0 = new DecimalFormat("#");
	        return Integer.parseInt(df_u0.format(Double.parseDouble(v)));
	        
	    //  if(v.indexOf(".") != -1){
	    //      return Integer.parseInt(Math.floor(Double.parseDouble(v)) + "");
	    //  }else{
	    //      return Integer.parseInt(getNum(pValue));
	    //  }
	    }

	public static int toInt(String value, int defaultValue) {
		if (value == null) {
			return defaultValue;
		} else {
			try {
				return Integer.parseInt(value);
			} catch (NumberFormatException arg2) {
				return defaultValue;
			}
		}
	}

	public static String lpad(String str, String f_char, int size) {
		return str.length() >= size ? str : getFillChar("", f_char, size - str.length()) + str;
	}

	public static String rpad(String str, String f_char, int size) {
		return str.length() >= size ? str : str + getFillChar("", f_char, size - str.length());
	}
	
	public static String getFillChar(String str, String f_char, int size) {
		String fillChar = "";
		if (str.length() >= size) {
			return str;
		} else {
			for (int index = 0; index < size - str.length(); ++index) {
				fillChar = fillChar + f_char;
			}

			return str + fillChar;
		}
	}

	public static String strToDate(String data) throws ParseException {
		Date date = new SimpleDateFormat("yyyyMMdd").parse(data);
		SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
		
		return sdf.format(date);
	}
	
	public static void alertFunction(HttpServletResponse response, String message) throws IOException {

		response.setContentType("text/html; charset=euc-kr");
		PrintWriter out = response.getWriter();
		out.println("<script>");
		out.println("alert('" + message + "');");	
		out.println("location.href='/';");
		out.println("</script>");
		out.close();
	}
}