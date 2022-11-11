package samseon.admin;

import java.util.ArrayList;
import java.util.List;

public class test {
	public static List<Integer> get_id_list(int a){
		List<Integer> id_list=new ArrayList();
		for(int i=0;i<a;i++) {
			id_list.add(i);
		}
		return id_list;
	}

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int a=5;
		List<Integer> id_list=get_id_list(a);
		for(int i=0; i<a; i++) {
			System.out.println(id_list.get(i));
		}

	}

}
