//
//  QuestionViewController.swift
//  WordList
//
//  Created by 杉井位次 on 2023/05/08.
//

import UIKit

class QuestionViewController: UIViewController {
    
    @IBOutlet var answerLabel: UILabel!
    @IBOutlet var questionLabel: UILabel!
    @IBOutlet var nextButton: UIButton!
    
    var isAnswered: Bool = false
    var wordArray: [Dictionary<String,String>] = []//UserDefaultsからとる配列
    var nowNumber: Int = 0//現在の回答数
    let saveDate = UserDefaults.standard//UserDefaultsにアクセス

    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
    }
    
    //配列データをUserDefaultsから取得しその配列の中身をシャッフルした後、questionLabelに表示させる
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        
        wordArray = saveDate.array(forKey: "WORD") as! [Dictionary<String, String>]
        wordArray.shuffle()
        questionLabel.text = wordArray[nowNumber]["english"]
    }
    
    @IBAction func nextButtonTapped() {
        
        if isAnswered {
            //次の問題へ
            nowNumber += 1
            answerLabel.text = ""
            
            if nowNumber < wordArray.count{
                //次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                //ボタンのタイトルを表示
                nextButton.setTitle("答えを表示", for: .normal)
            }else{
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        }else{
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
