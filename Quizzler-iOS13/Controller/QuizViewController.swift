import UIKit

class QuizViewController: UIViewController {
    
    /*
        code can only live in these places
             property definition
             constructor aka init method
             function
    */
    
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var progressBar: UIProgressView!
    
    @IBOutlet weak var aButton: UIButton!
    @IBOutlet weak var bButton: UIButton!
    @IBOutlet weak var cButton: UIButton!
    

    
    var quiz: Quiz = Quiz(questions: []) // initialize the quiz with an initial value, an empty quiz
    // Quiz(questions: []) is the same as Quiz.init(questions: [])
    
    var currentQuestion: Question? // a property of the VC
    
    var gotQuestionCorrect: Bool = false
    // used to alter progress bar
    var questionText: String = ""
    var answerText: [String] = [""]
    

    
    override func viewDidLoad() { // this runs only once, before the UI elements on the screen
        
        // before we do anything else, call the superclass method.  We are calling viewDidLoad() from the superclass UIViewController aka the class we are inheriting from as seen on line 3
        super.viewDidLoad()
        
        // self.quiz draws from this instance.  Which is the QuizViewController
        // we now make the quiz
        // we are initializing the quiz property of this viewController.  The value is a quiz created from the Quiz struct initialized with the data in our Questions struct.
        self.quiz = Quiz(questions: Questions.mochiData)
        
        // set progress bar to zero
        self.progressBar.setProgress(Float(0), animated: true)
        
        // method we added to update the view with first question - see below
        updateUI()
    }
    
    // the Action method is like an event listener in JS
    // the _ means that there is no name that the caller uses, the "sender" is the name that you use in the func itself to refer to that argument
    @IBAction func answerButtonPressed(_ sender: UIButton) {
        
        // if there is anything in self.currentQuestion (which is optional), then assign it to the local currentQuestion immutable variable
        // we are converting an optional value, into a non-optional value so we can work with currentQuestion w/out worrying if it has a value or not
        // guard says, try to unwrap the optional value & if we can, assign it to the variable... if we can't unwrap it because there is nothing there in self.currentQuestion then we go to the else statement
        guard let currentQuestion = self.currentQuestion else { //  currentQuestion is local var inside the func.  Guard let unwraps an optional.
            
            // you must bail out of the answerButtonPressed func if the self.currentQuestion has no value... this is the value of the guard - strict defensive programming preventing insidious bugs
            return
        }
        
        
        // var currentTitle: String? { get }  ... the get means you can get it, but you Can't set it
        // sender is the button itself
        guard let userAnswer = sender.currentTitle else {
            // bail out of the func w/ a return, because sender.currentTitle has no value
            return
        }
        
        if currentQuestion.isAnswerCorrect(userAnswer) {
            // answer is correct / returns True
            sender.setTitle("Yes!", for: UIControl.State.normal)
            sender.setTitleColor(UIColor.green, for: .normal)
            quiz.updateScore()
            self.gotQuestionCorrect = true
            
        } else {
            // answer is incorrect / returns False
            sender.setTitle("Try Again", for: UIControl.State.normal)
            sender.setTitleColor(UIColor.red, for: .normal)
            
            self.gotQuestionCorrect = false
        }
        


        let seconds = 2.0
        DispatchQueue.main.asyncAfter(deadline: .now() + seconds) { // implements a delay

            // never do this, never compare a bool
//            if self.gotQuestionCorrect == true {
            
            // swift no have truthy
            if self.gotQuestionCorrect {
                            print(self.quiz.percentComplete())
                            self.progressBar.setProgress(Float(self.quiz.percentComplete()), animated: true)
                self.updateUI()
            }

        }
        

    }
    
    // we can define the functions down below
        func updateUI() {
            
            self.scoreLabel.text = "Score: \(self.quiz.getScore())"
            print ("in the updateUI")
            // get new question
            guard let newQuestion = self.quiz.nextQuestion() else { // guard is for handling edge nil case
                print("you have finished the quiz!")
                self.showEndOfQuiz()
                return
            }
            
//            print(self.quiz.percentComplete())
//            self.progressBar.setProgress(Float(self.quiz.percentComplete()), animated: true)
                  
            self.currentQuestion = newQuestion
            
            // set buttons back to normal white color
            self.aButton.setTitleColor(UIColor.white, for: .normal)
            self.bButton.setTitleColor(UIColor.white, for: .normal)
            self.cButton.setTitleColor(UIColor.white, for: .normal)
            
            // set question text to new question
            self.questionText = newQuestion.prompt
            self.questionLabel.text = self.questionText

            // set answer options to new answers
            let answerOptions = newQuestion.answers
            self.aButton.setTitle(answerOptions["a"], for: UIControl.State.normal)
            self.bButton.setTitle(answerOptions["b"], for: .normal)
            self.cButton.setTitle(answerOptions["c"], for: .normal)
        }
        
    func showEndOfQuiz() {
        let endOfQuizStoryboard = UIStoryboard(name: "EndOfQuiz", bundle: nil)
        if let endOfQuizViewController = endOfQuizStoryboard.instantiateInitialViewController() { // if let unwraps, doesn't require bail out
            present(endOfQuizViewController, animated: true)
        } else {
            print("it returned nil")
        }
    }

}
