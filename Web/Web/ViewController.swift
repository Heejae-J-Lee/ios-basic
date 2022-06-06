//
//  ViewController.swift
//  Web
//
//  Created by Heejae on 2022/06/04.
//

import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    @IBOutlet var txtUrl: UITextField!
    @IBOutlet var myWebView: WKWebView!
    @IBOutlet var MyActivityIndicator: UIActivityIndicatorView!
    
    func loadWebPage(_ url: String){
        let myUrl = URL(string: url)
        let myRequest = URLRequest(url: myUrl!)
        myWebView.load(myRequest)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        myWebView.navigationDelegate = self
        loadWebPage("http://www.naver.com")
        
    }
    
    func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
        MyActivityIndicator.startAnimating()
        MyActivityIndicator.isHidden = false
    }

    func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    
    func webView(_ webView: WKWebView, didFail navigation: WKNavigation!, withError error: Error) {
        MyActivityIndicator.stopAnimating()
        MyActivityIndicator.isHidden = true
    }
    
    func checkUrl(_ url: String) -> String {
        var strUrl = url
        let flag = strUrl.hasPrefix("http://")
        if !flag {
            strUrl = "http://" + strUrl
        }
        return strUrl
    }
    
    @IBAction func btnGotoUrl(_ sender: UIButton) {
        let myUrl = checkUrl(txtUrl.text!)
        txtUrl.text = ""
        loadWebPage(myUrl)
    }
    @IBAction func btnGoSite1(_ sender: UIButton) {
        loadWebPage("http://failinmac.tistory.com")
    }
    @IBAction func btnGoSite2(_ sender: UIButton) {
        loadWebPage("http://blog.2sam.net")
    }
    @IBAction func btnLoadHtmlString(_ sender: UIButton) {
        let htmlString = "<h1> HTML STRING </h1><p> String 변수를 이용한 웹 페이지 </p><p><a href=\"http://www.naver.com\">naver</a>으로 이동</p>"
        myWebView.loadHTMLString(htmlString, baseURL: nil)
    }
    @IBAction func btnLoadHtmlFile(_ sender: UIButton) {
        let filePath = Bundle.main.path(forResource: "htmlView", ofType: "html")
        let myUrl = URL(fileURLWithPath: filePath!)
        let myRequest = URLRequest(url: myUrl)
        myWebView.load(myRequest)
    }
    @IBAction func btnStop(_ sender: UIBarButtonItem) {
        myWebView.stopLoading()
    }
    @IBAction func btnRefresh(_ sender: UIBarButtonItem) {
        myWebView.reload()
    }
    @IBAction func btnGoRewind(_ sender: UIBarButtonItem) {
        myWebView.goBack()
    }
    @IBAction func btnGoFoward(_ sender: UIBarButtonItem) {
        myWebView.goForward()
    }
    
}
