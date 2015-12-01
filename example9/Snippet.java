package example4;

import java.util.ArrayList;

public class Snippet {
	//array of [num] numbers. if number is odd, insert into arraylist + 1
	public ArrayList<Integer> modArray(){
		int num =+ 10;
		int[] array = new int[num];
		ArrayList<Integer> newArray = new ArrayList<Integer>();
		
		for(int i = 0; i<array.length;i++){
			array[i] = i;
		}
		
		for(int i = 0; i<array.length;i++){
			if(array[i] % 2 > 0){
				newArray.add(array[i] + 1);
			}
		}
		return newArray;
	}
}
