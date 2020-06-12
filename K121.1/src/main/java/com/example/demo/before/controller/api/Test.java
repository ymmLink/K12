package com.example.demo.before.controller.api;

public class Test {
	public static void main(String[] args) {
		String reg="<.+?>|&nbsp;";
		String s="</table>（3）联系上下文，注意划线的部分，理解下列句子。<br />①她们越飞越高，飞到没有寒冷、没有饥饿的天堂里去了。<br />②这时，人们看到了一个小女孩<bdo class=\"mathjye-underline\">冻死在墙角</bdo>，<bdo class=\"mathjye-underline\">她脸上放着光彩</bdo>，<bdo class=\"mathjye-underline\">嘴边露着微笑</bdo>。";
		s=s.replaceAll(reg, "");
		System.out.println(s);
	}
}
