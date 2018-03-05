package com.tf.tadmin.utils;

import org.apache.poi.hssf.usermodel.*;
import org.apache.poi.ss.usermodel.Cell;
import org.apache.poi.ss.usermodel.CellType;

import java.text.DecimalFormat;

public class ExcelUtil {
    /**
     * 设置单元格文字样式
     *
     * @param wb
     * @param font
     * @return
     */
    public static HSSFCellStyle operateCellStyle(HSSFWorkbook wb, HSSFFont font) {
        HSSFCellStyle cellStyle = wb.createCellStyle();
        cellStyle.setFont(font);
        return cellStyle;
    }

    /**
     * 设置字体的样式,字体的大小
     *
     * @param wb
     * @param type
     * @param point
     * @return
     */
    public static HSSFFont operateFont(HSSFWorkbook wb, String type, short point, Boolean bool) {
        HSSFFont font = wb.createFont();
        if (bool == true) {
            font.setBold(true); // 加粗
        }
        font.setFontName(type); // 设置字体
        font.setFontHeightInPoints(point);// 设置字体大小
        return font;
    }

    /**
     * 对某一行依次添加source的内容
     *
     * @param isChange 是否换行
     * @param sheet
     * @param rowCount
     * @param source
     */
    public static void operateRow(HSSFSheet sheet, int rowCount, HSSFCellStyle style, Boolean isChange,
                                  Object... source) {
        HSSFRow row = sheet.createRow(rowCount);
        for (int i = 0; i < source.length; i++) {
            HSSFCell cell = row.createCell(i);
            if (isChange == true) {
                style.setWrapText(true);
            }
            cell.setCellStyle(style);
            // 默认设置为String
            cell.setCellType(CellType.STRING);
            cell.setCellValue(source[i] == null ? "" : source[i] + "");
        }

    }

    /**
     * 对某一行依次添加source的内容
     *
     * @param sheet
     * @param rowCount
     * @param source
     */
    public static void operateRow(HSSFSheet sheet, int rowCount, HSSFCellStyle style,
                                  Object... source) {
        HSSFRow row = sheet.createRow(rowCount);
        for (int i = 0; i < source.length; i++) {
            HSSFCell cell = row.createCell(i);
            cell.setCellStyle(style);
            // 默认设置为String
            cell.setCellValue(source[i] == null ? "" : source[i] + "");
        }

    }

    /**
     * 从第n列开始,依次对表格的宽度赋值
     *
     * @param sheet
     * @param startColumn
     */
    public static void operateColumn(HSSFSheet sheet, int startColumn, int... width) {
        for (int i = 0; i < width.length; i++) {
            sheet.setColumnWidth(i + startColumn, width[i] * 256); // 设置列宽，20个字符宽
        }
    }

    /**
     * Description:获取单元格数据
     * int CELL_TYPE_NUMERIC = 0;
     * int CELL_TYPE_STRING = 1;
     * int CELL_TYPE_FORMULA = 2;
     * int CELL_TYPE_BLANK = 3;
     * int CELL_TYPE_BOOLEAN = 4;
     * int CELL_TYPE_ERROR = 5;
     */
    public static String getFromCell(Cell cell) {
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
