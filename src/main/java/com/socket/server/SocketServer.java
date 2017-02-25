package main.java.com.socket.server;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.net.ServerSocket;
import java.net.Socket;

import org.junit.Test;

public class SocketServer {

	/**
	 * 
	 * 服务器端的工作就是在指定的端口上监听
	 * 1.建立连接
	 * 2.打开输出流
	 * 3.封装输出流
	 * 4.向客户端发送数据
	 * 5.关闭打开的输出流
	 * 6.关闭打开的socket对象
	 */
	@Test
	public static void main(String[] args) {
		// TODO Auto-generated method stub

		try {
			ServerSocket s = new ServerSocket(8888);
			while(true){
				//建立连接
				Socket socket = s.accept();
				//打开输出流
				OutputStream os = socket.getOutputStream();
				//封装输出流
				DataOutputStream dos = new DataOutputStream(os);
				//向客户端发送数据
				dos.writeUTF("客户端地址信息："+socket.getInetAddress()+"\t客户端通信端口号:"+socket.getPort());
				dos.writeUTF("I am a server!");
				//关闭打开的输出流
				os.close();
				//关闭打开的socket对象
				socket.close();
			}
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

}
