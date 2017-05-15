//
//  RankingViewController.swift
//  SwiftFirstApp
//
//  Created by Natsumo Ikeda on 2016/06/23.
//  Copyright 2017 FUJITSU CLOUD TECHNOLOGIES LIMITED All Rights Reserved.
//

import UIKit
import NCMB

class RankingViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    // 「rankingTableView」ランキングを表示するテーブル
    @IBOutlet weak var rankingTableView: UITableView!
    // ランキング取得数
    let rankingNumber = 5
    // 取得したデータを格納する配列
    var rankingArray: Array<NCMBObject> = []
    
    // 画面表示時に実行されるメソッド
    override func viewDidLoad() {
        super.viewDidLoad()
        rankingTableView.delegate = self
        rankingTableView.dataSource = self
        // 保存したデータの検索と取得
        checkRanking()
    }
    
    // 【mBaaS】保存したデータの検索と取得
    func checkRanking() {
        // **********【問題２】ランキングを表示しよう！**********
        
        
        
        
        
        
        
        
        
        
        
        

        // **************************************************
    }
    
    // rankingTableViewのセルの数を指定
    func tableView(_ table: UITableView, numberOfRowsInSection section: Int) -> Int {
        return rankingNumber
    }
    
    // rankingTableViewのセルの内容を設定
    func tableView(_ table: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // キーを「cell」としてcellデータを取得
        let cell = rankingTableView.dequeueReusableCell(withIdentifier: "rankingTableCell", for: indexPath)
        var object: NCMBObject?
        // 「表示件数」＜「取得件数」の場合のobjectを作成
        if indexPath.row < rankingArray.count {
            object = self.rankingArray[indexPath.row]
        }
        
        // 順位の表示
        let ranking = cell.viewWithTag(1) as! UILabel
        ranking.text = "\(indexPath.row+1)位"
        
        if let unwrapObject = object {
            // 名前の表示
            let nameLabel = cell.viewWithTag(2) as! UILabel
            let name = unwrapObject.object(forKey: "name") as! String?
            if name != nil {
                nameLabel.text = name! + "さん"
            }
            
            // スコアの表示
            let scoreLabel = cell.viewWithTag(3) as! UILabel
            let score = unwrapObject.object(forKey: "score") as! Int?
            if score != nil {
                scoreLabel.text = String(score!) + "連打"
            }
        }
        
        return cell
    }
}
