package com.analysefeeds.twitter.twitterpositivityscore.controller;

import java.io.IOException;

import javax.servlet.http.HttpServletResponse;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class HomeController {

	@RequestMapping(value="/home")
	public ModelAndView home(HttpServletResponse response) throws IOException{
		return new ModelAndView("home");
	}
	@RequestMapping(value="/header")
	public ModelAndView header(HttpServletResponse response) throws IOException{
		return new ModelAndView("header");
	}
	@RequestMapping(value="/feeds")
	public ModelAndView feeds(HttpServletResponse response) throws IOException{
		return new ModelAndView("feeds");
	}
	@RequestMapping(value="/history")
	public ModelAndView history(HttpServletResponse response) throws IOException{
		return new ModelAndView("history");
	}
}
