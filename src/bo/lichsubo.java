package bo;

import java.util.ArrayList;

import bean.lichsubean;
import dao.lichsudao;

public class lichsubo {
	lichsudao lsdao = new lichsudao();
	public ArrayList<lichsubean> getList(long makh){
		return lsdao.getlichsu(makh);
	}
}
