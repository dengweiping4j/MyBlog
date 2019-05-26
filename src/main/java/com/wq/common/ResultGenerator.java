package com.wq.common;

/**
 * 响应结果生成工具
 */
public class ResultGenerator {
    private static final String DEFAULT_SUCCESS_MESSAGE = "success";
    private static final String DEFAULT_FAIL_MESSAGE = "fail";

    public static Result genSuccessResult() {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        return result;
    }

    /*
     *根据mybatis返回的操作影响的行数判断是否操作成功，返回相应值
     */
    public static Result genResult(int total) {
        Result result = new Result();
        if (total > 0) {
            result.setResultCode(Constants.RESULT_CODE_SUCCESS);
            result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        } else {
            result.setResultCode(Constants.RESULT_CODE_SERVER_ERROR);
            result.setMessage(DEFAULT_FAIL_MESSAGE);
        }
        return result;
    }

    public static Result genSuccessResult(Object data) {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SUCCESS);
        result.setMessage(DEFAULT_SUCCESS_MESSAGE);
        result.setData(data);
        return result;
    }

    public static Result genFailResult(String message) {
        Result result = new Result();
        result.setResultCode(Constants.RESULT_CODE_SERVER_ERROR);
        if (message == null || message.length() < 1) {
            message = DEFAULT_FAIL_MESSAGE;
        }
        result.setMessage(message);
        return result;
    }

}
