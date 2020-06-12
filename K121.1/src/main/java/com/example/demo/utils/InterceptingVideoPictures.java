package com.example.demo.utils;

import java.io.File;
import java.util.List;

public class InterceptingVideoPictures {
	public static String ffmpeg_path="C:\\getVideoImg\\ffmpeg-20180227-fa0c9d6-win64-static\\bin\\ffmpeg.exe";
	public static boolean processImg(String veido_path, String ffmpeg_path) {
		File file = new File(veido_path);
		if (!file.exists()) {
			System.err.println("路径[" + veido_path + "]对应的视频文件不存在!");
			return false;
		}
		List<String> commands = new java.util.ArrayList<String>();
		commands.add(ffmpeg_path);
		commands.add("-i");
		commands.add(veido_path);
		commands.add("-y");
		commands.add("-f");
		commands.add("image2");
		commands.add("-ss");
		commands.add("2");// 这个参数是设置截取视频多少秒时的画面
		// commands.add("-t");
		// commands.add("0.001");
		commands.add("-s");
		commands.add("690x387");
		commands.add(veido_path.substring(0, veido_path.lastIndexOf("."))
				.replaceFirst("vedio", "file") + ".jpg");
		try {
			System.out.println(veido_path.substring(0, veido_path.lastIndexOf("."))
				.replaceFirst("vedio", "file") + ".jpg");
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commands);
			builder.start();
			System.out.println("截取成功");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public static boolean processImg1(String veido_path) {
		File file = new File(veido_path);
		if (!file.exists()) {
			System.err.println("路径[" + veido_path + "]对应的视频文件不存在!");
			return false;
		}
		List<String> commands = new java.util.ArrayList<String>();
		commands.add(ffmpeg_path);
		commands.add("-i");
		commands.add(veido_path);
		commands.add("-y");
		commands.add("-f");
		commands.add("image2");
		commands.add("-ss");
		commands.add("2");// 这个参数是设置截取视频多少秒时的画面
		// commands.add("-t");
		// commands.add("0.001");
		commands.add("-s");
		commands.add("690x387");
		commands.add(veido_path.substring(0, veido_path.lastIndexOf("."))
				.replaceFirst("vedio", "file") + ".jpg");
		try {
			System.out.println(veido_path.substring(0, veido_path.lastIndexOf("."))
				.replaceFirst("vedio", "file") + ".jpg");
			ProcessBuilder builder = new ProcessBuilder();
			builder.command(commands);
			builder.start();
			System.out.println("截取成功");
			return true;
		} catch (Exception e) {
			e.printStackTrace();
			return false;
		}
	}
	public static void main(String[] args) {
		processImg("C:/images/2019/08/21/kD7nm165132572.MP4",
				"C:\\getVideoImg\\ffmpeg-20180227-fa0c9d6-win64-static\\bin\\ffmpeg.exe");
	}

	
}
