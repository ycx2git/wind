package main.java.com.socket.client;

import java.io.DataInputStream;
import java.io.IOException;
import java.io.InputStream;
import java.net.Socket;
import java.net.UnknownHostException;

import com.mysql.jdbc.CallableStatement;



public class SocketClient {

	/*
	 * 
	 * 1.创建socket对象，指定服务器地址和服务器监听的端口号
	 * 2.客户端在new的时候就发出了连接请求，服务器端就会进行处理,如果服务器没有开启服务，那么就会找不到服务器，并抛出异常：java.net.ConnectException: Connection refused: connect
	 */
	public static void main(String[] args){
		
		//创建socket对象
		try {
			Socket s1 = new Socket("127.0.0.1",8888);
			//打开输入流
			InputStream is = s1.getInputStream();
			//封装输入流
			DataInputStream dis = new DataInputStream(is);
			//打印服务端发来的信息
			System.out.println(dis.readUTF());
			System.out.println(dis.readUTF());
			//关闭输入流
			is.close();
			//关闭socket
			s1.close();
		} catch (UnknownHostException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
	}
}
