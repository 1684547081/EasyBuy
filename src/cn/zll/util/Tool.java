package cn.zll.util;



import java.lang.reflect.Field;
import java.lang.reflect.Method;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

public class Tool<T> {
	@SuppressWarnings("unchecked")
	public  List<T> list(ResultSet rs,Class<T> cls) throws Exception{
		List<T> list=new ArrayList<T>();
		Field[] fields = cls.getDeclaredFields();
		if(rs!=null){
			while (rs.next()) {
				Object obj=cls.newInstance();
				for (Field field : fields) {
					String name=field.getName();
					Method method = cls.getDeclaredMethod("set"+name.substring(0,1).toUpperCase()+name.substring(1),field.getType());
					try {
						
						method.invoke(obj,rs.getObject(name));
					} catch (Exception e) {
						continue;
					}

				}
				list.add((T)obj);
			}
		}
		return list;
	}
}
