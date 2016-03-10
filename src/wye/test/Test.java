package wye.test;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileReader;
import java.io.IOException;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

public class Test {
	public static String readFile(String local) throws IOException {
		BufferedReader br = new BufferedReader(new FileReader(new File(local)));
		String line = "";
		StringBuffer sb = new StringBuffer();
		while((line = br.readLine()) != null){
			sb.append(line+"\n");
		}
		br.close();
		return sb.toString();
	}

	public static void main(String[] args) {
		String str ="";
		try {
			str = readFile("D:/a.txt");
			System.out.println(str);
		} catch (IOException e) {
		}
		
		Pattern p = Pattern.compile("^07{10}$");
		Matcher m = p.matcher(str);
		System.out.println("ceshi ");
		if (m.find()) {
			String group = m.group();
			System.out.println(group);
//			sb.append(group);
//			String subStr = str.substring(group.length());
//			Pattern pattern = Pattern.compile(".*\\d+.*");
//			if (pattern.matcher(subStr).matches()) {
//				getStrings(sb,str.substring(group.length()));
//			}
		}
//		return sb.toString();
	}
}
