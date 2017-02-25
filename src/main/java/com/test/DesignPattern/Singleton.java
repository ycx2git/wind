package main.java.com.test.DesignPattern;

/*
 * 单例设计模式
 */
public class Singleton {

	/*
	 * 1.懒汉式单例模式,在第一次调用的时候实例化自己 
	 * 2.缺陷：非线程安全，当并发时会出现多个实例 
	 */
	private Singleton(){};//私有的构造方法，避免了类在外部被实例化（实际通过反射机制可以实例化）
	
	private static Singleton single =null;
	
	public static Singleton getInstance(){
		if(single==null)
		single = new Singleton();
		return single;
	}
	/*
	 * 解决懒汉式单例模式线程安全问题
	 */
	//1.给getInstance方法加同步锁,并发时会影响到性能
	/*public static synchronized Singleton getInstance(){
		if(single==null)
		single = new Singleton();
		return single;
	}*/
	//2.双重检查锁定,多线程时存在隐患，线程A在执行构造方法之前离开，此时single已经不为空，但是未得到实例。B线程进入，则会判断出错？
	/*public static Singleton getInstance(){
		if(single==null){
			synchronized(Singleton.class){
				if(single==null){
					single = new Singleton();
				}
			}
		}
	}*/
	//3.静态内部类,只有在第一次加载时才会实例化
	/*private static class lazyHolder{
		private static final Singleton INSTANCE = new Singleton();
	}
	public static Singleton getInstance(){
		return lazyHolder.INSTANCE;
	}*/
	//饿汉式单例.直接在类创建的时候实例化,也可以保证单例  加volatile关键字：保证可见性，即实例一旦创建成功马上对其他线程可见，禁止指令重排序优化
	//new Singleton不是原子操作
	/*private static Singleton single = new Singleton();
	  public static Singleton getInstance(){
	  return single;
	}*/
}
