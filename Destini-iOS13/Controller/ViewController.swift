//
//  ViewController.swift
//  Destini-iOS13
//
//  Created by Angela Yu on 08/08/2019.
//  Copyright © 2019 The App Brewery. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var storyLabel: UILabel!
    @IBOutlet weak var choice1Button: UIButton!
    @IBOutlet weak var choice2Button: UIButton!
    
    var story = StoryBrain()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let firstStory = story.stories[0]
        updateUI(nextStory: firstStory)

    }

    @IBAction func choiceMade(_ sender: UIButton) {
        let nextStory: Story
        //identify which button pressed with tag
        if(sender.tag == 1) {
            let choice1Destination = story.stories[story.nextStoryIndex].choice1Destination
            nextStory = story.stories[choice1Destination]
            //update nextStoryIndex in Story Object
            story.nextStoryIndex = choice1Destination
            updateUI(nextStory: nextStory)
        }else if(sender.tag == 2) {
            let choice2Destination = story.stories[story.nextStoryIndex].choice2Destination
            nextStory = story.stories[choice2Destination]
            //update nextStoryIndex in Story Object
            story.nextStoryIndex = choice2Destination
            updateUI(nextStory: nextStory)
        }
    }
    
    func updateUI(nextStory: Story) {
        storyLabel.text = nextStory.title
        choice1Button.setTitle(nextStory.choice1, for: .normal)
        choice2Button.setTitle(nextStory.choice2, for: .normal)
        
    }
    
}

