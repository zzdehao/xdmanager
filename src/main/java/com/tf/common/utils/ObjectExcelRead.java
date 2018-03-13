package com.tf.common.utils;
import java.io.File;
import java.io.FileInputStream;
import java.io.InputStream;
import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import org.apache.poi.ss.usermodel.*;
/**
 * 从EXCEL导入到数据库
 *  读取excel信息
 */
public class ObjectExcelRead {
	/**
	 * @param filepath //文件路径
	 * @param filename //文件名
	 * @param startrow //开始行号
	 * @param startcol //开始列号
	 * @param endcol //结束列号码
	 * @param sheetnum //sheet
	 * @return list
	 */
	public static List<Object> readExcel(String filepath, String filename,
										 int startrow, int startcol,int endcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();
		try {
			File target = new File(filepath, filename);
			FileInputStream fi = new FileInputStream(target);
			Workbook wb = WorkbookFactory.create(fi);
			Sheet sheet = wb.getSheetAt(sheetnum);
			int rowNum = sheet.getLastRowNum() + 1;
			//System.out.println("rowNum:"+rowNum);
			for (int i = startrow; i < rowNum; i++) {
				Map varpd = new HashMap();
				Row row = sheet.getRow(i);

				int cellNum = row.getLastCellNum();
				if(endcol!=0){
					cellNum=endcol;
				}
				//System.out.println("cellNum:"+cellNum);
				for (int j = startcol; j < cellNum; j++) {

					Cell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						System.out.println("cellType:"+cell.getCellType());
						switch (cell.getCellType()) {
						case 0:
							cellValue = String.valueOf((int) cell.getNumericCellValue());
							break;
						case 1:
							cellValue = cell.getStringCellValue();
							break;
						case 2:
							cellValue = cell.getNumericCellValue() + "";
							// cellValue = String.valueOf(cell.getDateCellValue());
							break;
						case 3:
							cellValue = "";
							break;
						case 4:
							cellValue = String.valueOf(cell.getBooleanCellValue());
							break;
						case 5:
							cellValue = String.valueOf(cell.getErrorCellValue());
							break;
						}
					} else {
						cellValue = "";
					}
					//System.out.println("cellValue:"+cellValue);
					
					varpd.put("var"+j, cellValue.trim());
					
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return varList;
	}
	public static List<Object> readExcelInputStream(InputStream inputStream,
										 int startrow, int startcol,int endcol, int sheetnum) {
		List<Object> varList = new ArrayList<Object>();
		try {
			Workbook wb = WorkbookFactory.create(inputStream);
			Sheet sheet = wb.getSheetAt(sheetnum);
			int rowNum = sheet.getLastRowNum() + 1;
			//System.out.println("rowNum:"+rowNum);
			for (int i = startrow; i < rowNum; i++) {
				Map varpd = new HashMap();
				Row row = sheet.getRow(i);

				int cellNum = row.getLastCellNum();
				if(endcol!=0){
					cellNum=endcol;
				}
				for (int j = startcol; j < cellNum; j++) {

					Cell cell = row.getCell(Short.parseShort(j + ""));
					String cellValue = null;
					if (null != cell) {
						cellValue = getFromCell(cell);
					} else {
						cellValue = "";
					}
					varpd.put("var"+j, cellValue.trim());
				}
				varList.add(varpd);
			}

		} catch (Exception e) {
			System.out.println(e);
		}
		return varList;
	}
	private static String getFromCell(Cell cell) {
		if (cell == null) {
			return "";
		}
		if (CellType.NUMERIC.compareTo(cell.getCellTypeEnum()) == 0) {
			DecimalFormat decimalFormat = new DecimalFormat("0");
			return decimalFormat.format(cell.getNumericCellValue());
		}
		if (CellType.STRING.compareTo(cell.getCellTypeEnum()) == 0) {
			return String.valueOf(cell.getStringCellValue());
		}
		if (CellType.FORMULA.compareTo(cell.getCellTypeEnum()) == 0) {
			return String.valueOf(cell.getCellFormula());
		}
		if (CellType.BLANK.compareTo(cell.getCellTypeEnum()) == 0) {
			return "";
		}
		if (CellType.BOOLEAN.compareTo(cell.getCellTypeEnum()) == 0) {
			return String.valueOf(cell.getBooleanCellValue());
		}
		return "";
	}
}
