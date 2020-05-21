package com.alipay.config;

import java.io.FileWriter;
import java.io.IOException;

/* *
 *类名：AlipayConfig
 *功能：基础配置类
 *详细：设置帐户有关信息及返回路径
 *修改日期：2017-04-05
 *说明：
 *以下代码只是为了方便商户测试而提供的样例代码，商户可以根据自己网站的需要，按照技术文档编写,并非一定要使用该代码。
 *该代码仅供学习和研究支付宝接口使用，只是提供一个参考。
 */

public class AlipayConfig {
	
//↓↓↓↓↓↓↓↓↓↓请在这里配置您的基本信息↓↓↓↓↓↓↓↓↓↓↓↓↓↓↓

	// 应用ID,您的APPID，收款账号既是您的APPID对应支付宝账号
	public static String app_id = "2016101300675198";
	
	// 商户私钥，您的PKCS8格式RSA2私钥
    //public static String merchant_private_key = "MIIEvgIBADANBgkqhkiG9w0BAQEFAASCBKgwggSkAgEAAoIBAQCLwO6ynjMrcsryvySlkqkFSv7xnCcI7ksp1/rdYDJ6/lX/ZwEOddMuGl8Kf0yX2dC6WflA0KQGNmIiUB1igFPmfIUHrORoTaogvrHgQ4QRQOOybdWJOg4BRrboN+yq/jTwYSM8aO7G9+5Lr87JYjsOEw4O7/lFBwpZaJqjaBARaG2op/j11riEkUEJb6bmbER1zAhOuOijGriPGrn73xTxxaGVSUFAaJsokdBSUDGDy9A8KX4Ad62NKN6AgqyydyjD81UzHp9zPOJW/HT0rgMD8gY0h+OBeH8vgNbCpfyKGmroMqSnWWg6APe02Cg3SthuyUquASEsDaug6udN7vetAgMBAAECggEBAIDt7AizNEfYLm1GdBugMvhkGNFzmvt9Q7CFxbVn4wpfC52FPI9Hmh0FTTsU9+d7ljnlebMXCMuGboBzYriV5VFU/TF4invDcrmk09suzm9QawAYnhBsk7EPuPyBY4DY5qQBKY24zNiYsKn4tpBJZGv2nlifgVryRNT5UPiBr5kuXGIhSDEmdzpDzWP13OVMam4FRhSOOp26Qwiydol61Rqf/Pfi+SHLeHAXueQgiFgmG0DfBHguQ49ocVXY71TirEMq5baOeKjbupehqPmTdIL8A2oPAQt+73hlBLy3g7KvCIlo/ooMPnIl4TActWg0miIeutApB4+BkczzJNStue0CgYEA0ddbRsFhvxTHqgok0WxZtiaXIkU9xlRa2yVYai9P4FagPR8PNIh4kM5IVIolKAWs/3ZEJu8GnUycnkd94Eh4xsuetFAAgqn/FpI8cH3jOxVL540aJ2l/OxaIs3ru1s1C2BVN3t2TOG9eNOZEmAgaBOkVLAIePCtUMQDcwzKEgY8CgYEAqn7ILutk53sYwcRpT9JMPi5Ig9B2e/UGQiXIOc6lL8gLYBnn64uIIBWIUFyJ8ouE/fBKhZM00BbmoSqO2x2fYXvZwAo+llwB7o8U0xfQfhHzbdprJsdthuo+WQEDRWqniU24Ko1LcgzDW69D82lhYcK/aIYPKMwqaRkSPq5n3QMCgYEArKrfsbYYn2oS7alRKH5Wx5qzjACb12G8LU1qll1+BaRiUEkJcvnE86q6O848ytT4yHDhnYPb1n2e9mLvgilAMJyGZ+rYsKv/eew1DX+ZBhn9Dni+B6Y4ij99lupWM6xND49gNz3uEWcahr7fvJYWCupcgIzxoiMpMPV7sqcT/6MCgYBgvrhRB3mmcI9HxHANv0NMNW8ofO3+wLbgahgH1V6ekmECEzEq025W5mEHWLteShUZE3T1/uYE/jm4UjHl3BVId8LD2gxRvbvK5p3meqjwILeFKl+LDbb0y469anm0tiSDIPrUCoE5IkzohbeFM9LyalO6t/d6KwAVywgzUTvWiQKBgGnUn+OFjUgARxLJ/i7dU8TeOtvC+uw8yTeHfLjtTVsQvcvVxU87zWxhhYNDe9SieOip2T7vZ/sC5xIhViBtl7Gwa9txM6f1JSYro05VhSofdD4KejFgB6CxUfV52rdVYgmYIAzgHa5XX07vdOm9dQX4DlhYgwRu7ZTrm+b99m4q";
    public static String merchant_private_key ="MIIEvQIBADANBgkqhkiG9w0BAQEFAASCBKcwggSjAgEAAoIBAQChOB1KzbiIduIierrOWfd42WicrfpWAcfcCj6ueJI5+Uu1XTwguG9yTBJ7O9KXqj1ngSGYzrFyKZIHeBEiu3NDhNTIqLITkORP1GBspTMKmx1yfIbdO4EYQ4L9wcGf1AzH+MQXRDheipijue8a6tECVVrSp+sSvUUZzIJdJxP0bk5P0G9NznMhFS7HTo0zazAaz2p1e+0hV1Nv1rf+/oC9X2Whwz5obpoA7+/dvvZOWj333LIjqeeC8vdTxo4RgMkHMjlx66RSyCinw06+7TG7nIMNJzdsMZhg4gEb9H2dE2CxMVa5pVKWMSboLmb8Uc+lW+/XBDJYFxzgiKLn369HAgMBAAECggEAJSuQ5VxE/YGbZaOySj1H518I1YbvPsEuWTcreIJoBGHL6MbURB8B4vJTGIKUbU9c1O5a1qZhFxcqifpOyRk63AhWHuV2GTjAyv8GNEZqXDmjMnAvj/ZWL0fxfZwcjkMPp1NdspeR/4oo4ybNUAFvqwAO7p60fh+RPP9/1wZZfXNLcTHqUYzPVDwyzKBglO1aHLVJQftco10DAUkAzYt2nMDUJcM4j45IFQ/aeBDS5PlRR90rYAOEJjSV0ew4iCIq9+yXI1sd2mUsRuyi8ZnNSjLK5YSF13lqLpBQ/58wGQroj8DxSg3e7TQsNnFzSNKQZ0W2c/hUDQDjOYTdPjcfAQKBgQDSrzoA5RlyUQqmJeqr+P0uqsgWzjTKqisHZqk76YfH4+P8SaO6VUypAf8L88f/Nd+TrqMrEMdvHuyt7KcWXsekxzxH96hfAzzdRxHGrhTTUzGDRigBfyk2hCBbcLio+d7BgIzYay7hNkhddw9HS1t8ymlBHvanbz6Ve4M3kiUbBwKBgQDD5TcfF/lm2ynTZnp15JEPDuzC+kBY306duih333Jh1F/7wCkINmR2phiTz7/0L1kMDsQHI3Bx7GYLfJJDAE7CJtNc3AzUyZR3QcZoJGsB3k1MJgUVZYGGw2bx4H9eLBVRpnfzdqFkaZTuiQzL9QoXdTlE75OxPqBYDPP0puB5wQKBgBPbgisNbN2Sd997GWhGGo7od912aBFmApI7Ad5sv2h+uUFRK4Znfcc8Me7Ndl8+k6kWv7hSZ4m4r3QhJwp7unN0d+EMnaj+5CCzDyDbzYixgawu05x4gMjroSUdNbpveqhgVmYbjBqcBCwTCbSdjKzxYwRJR9Q2Lv7l2lNFigvHAoGAW6UseHt6zkfR9XiH6geYZXcSBNWWrP0rhlbE/++lT2dP0DNB/vmTXn6uGNikcNSF0EJIKx7FSEbUJqOMuZO3RNVtJJA94H692l0HOUlwVlttxiYzUqM+SZG444enjqMJBj3e+COTtao/ZqjvN6vXoMnSlRGQAufNk+PbbaV0dwECgYEAxs/u4MnE6pXfBLGyYi6kkNU9tIqN3SMDZVFmQYjPx8+KTWaeXUDmJLH3DWlZ8uom3xSHDz2teJqK0rkooI4+auHXF360NTv2UhAyuHEMM28xNjcAH6Oiq6Xg6V7g6u/SZGkMyr/vQ+zi1JU24JOxCTeL0ofEyQPFQ++Eki76tMc=";
	// 支付宝公钥,查看地址：https://openhome.alipay.com/platform/keyManage.htm 对应APPID下的支付宝公钥。
    //"MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAi8Dusp4zK3LK8r8kpZKpBUr+8ZwnCO5LKdf63WAyev5V/2cBDnXTLhpfCn9Ml9nQuln5QNCkBjZiIlAdYoBT5nyFB6zkaE2qIL6x4EOEEUDjsm3ViToOAUa26Dfsqv408GEjPGjuxvfuS6/OyWI7DhMODu/5RQcKWWiao2gQEWhtqKf49da4hJFBCW+m5mxEdcwITrjooxq4jxq5+98U8cWhlUlBQGibKJHQUlAxg8vQPCl+AHetjSjegIKssncow/NVMx6fczziVvx09K4DA/IGNIfjgXh/L4DWwqX8ihpq6DKkp1loOgD3tNgoN0rYbslKrgEhLA2roOrnTe73rQIDAQAB";
    public static String alipay_public_key = "MIIBIjANBgkqhkiG9w0BAQEFAAOCAQ8AMIIBCgKCAQEAwI1cKeHK/pZKCOTRuFVCvXCMQ0F8I6X1IX11za0xwbg9z8GE38GX0yqNMBNP64IhKlkg+oXyQwrXZCSUlSx+zqzgqeOOI8eHrKxkj5V01Ol/0Yr+lexFVsFxbRdxBsYCriAH9Lmx+O+/PDK7e+jEe4UV43z9wSaFsynE//5+l75boyJJ0HPQupj3aT9VOPt0A5I4apYhovR933aqa349oMHYc0dUUUPrQ1606s1LRnGNzrRnisTYuXHscgyUDG1lqNvXJVbBEdkrH37/UeZ/GYFyar4RmklXCzg2aHOWLsKWXDk6JUXOVNbBW9Lg2bG/70IrgQde69CZ5hAqmoQ0/wIDAQAB";
	// 服务器异步通知页面路径  需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String notify_url = "http://localhost:8080/alipay.trade.page.pay-JAVA-UTF-8/notify_url.jsp";

	// 页面跳转同步通知页面路径 需http://格式的完整路径，不能加?id=123这类自定义参数，必须外网可以正常访问
	public static String return_url = "http://localhost:8080/EdcSystem/prev/ok.do";

	// 签名方式
	public static String sign_type = "RSA2";
	
	// 字符编码格式
	public static String charset = "utf-8";
	
	// 支付宝网关
	public static String gatewayUrl = "https://openapi.alipaydev.com/gateway.do";
	
	// 支付宝网关
	public static String log_path = "C:\\";


//↑↑↑↑↑↑↑↑↑↑请在这里配置您的基本信息↑↑↑↑↑↑↑↑↑↑↑↑↑↑↑

    /** 
     * 写日志，方便测试（看网站需求，也可以改成把记录存入数据库）
     * @param sWord 要写入日志里的文本内容
     */
    public static void logResult(String sWord) {
        FileWriter writer = null;
        try {
            writer = new FileWriter(log_path + "alipay_log_" + System.currentTimeMillis()+".txt");
            writer.write(sWord);
        } catch (Exception e) {
            e.printStackTrace();
        } finally {
            if (writer != null) {
                try {
                    writer.close();
                } catch (IOException e) {
                    e.printStackTrace();
                }
            }
        }
    }
}

