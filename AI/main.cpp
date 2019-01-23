//
//  main.cpp
//  AI
//
//  Created by Shane Butler on 11/11/2018.
//  Copyright © 2018 Shane Butler. All rights reserved.
//

#include <iostream>
#include <vector>
#include <string>
#include <iostream>
#include <sstream>
#include <fstream> // ifstream
#include <istream>

void rareDisease();
void markovModels();


int main(int argc, const char * argv[]) {
    std::cout << "Please select your required probability function" << std::endl;
    std::cout << "1. Rare Disease Probability" << std::endl;
    std::cout << "2. Hidden Markov Models" << std::endl;
    int userinput;
    std::cin >> userinput;
    if (userinput == 1)
    {
        rareDisease();
    }
    else if (userinput == 2){
        markovModels();
    }
    return 0;
}

void rareDisease(){
    float d, td, notTnotD;
    // d is prior probability of having disease, td is probability the test is positive given the person has the disease and notTnotD is the probality the test is negative given the person does not have the disease.
    std::cout << "Please enter the prior probability of having the disease (P(d))" << std::endl;
    std::cin >> d;
    std::cout << "Please enter the probability of the test being positive given the person has the disease (P(t|d))" << std::endl;
    std::cin >> td;
    std::cout << "Please enter the probability of the test being negative given the person does not have the disease (P(not t|not d))" << std::endl;
    std::cin >> notTnotD;
    
    float dt, t, tnotD, notD;
    // dt is the probability of having the disease given a positive test result, t is the probability of the test being positive, tnotD is the probability of the test being positive given the patient doesnt have the disease and notD is the prior probability of not having the disease
    
    tnotD = 1 - notTnotD; //tnotD is the opposite of notTnotD so both will sum to 1
    
    notD = 1 - d; //notD is the opposite of d so both will sum to 1
    t = (td * d) + (tnotD * notD);
    std::cout << t << std::endl;
    dt = (d * td) / t;
    
    std::cout << "The proability of the patient having the disease is:  ";
    std::cout << dt << std::endl;
    
    
}

void markovModels(){
    std::vector<char> sequence; //vector to store users sequence
    bool isEnd = false;
    
    //the following do loop is to get the desired sequence from the user
    do
    {
        std::cout << "Please enter your sequence of states as the letters C H and W or X to finish sequence" << std::endl;
        char test;
        std::cin >> test;
        if (test == 'x' || test == 'X')
        {
            isEnd = true;
        }
        else if (test == 'c' || test == 'C' || test == 'h' || test == 'H' || test =='w' || test == 'W')
        {
            sequence.push_back(test);
        }
    } while (isEnd == false);

    float transitionProbabilities [2][2] = {
        {0.6, 0.4},
        {0.4, 0.6}
        
    };
    
    float coldProbabilities [2][2] = {
        {0.3, 0},
        {0, 0.45}
        
    };
    
    float warmProbabilities [2][2] = {
        {0.35, 0},
        {0, 0.45}
    
    };
    
    float hotProbabilities [2][2] = {
        {0.35, 0},
        {0, 0.1}
    };
    
    float equiprobable [1][2] = {// this matrix is used to store the previous states probabilities
        {0.5, 0.5}
        
    };
    
    float tempArray [2][2];
    float tempArray2 [1][2];
    
    int sequenceSize = static_cast<int>(sequence.size());//get the size of the sequence
    //the following for loop is to loop through the sequence until the end
    for (int i = 0; i < sequenceSize; i++)
    {
        char currentState = sequence[i];//select the correct letter from the sequence
        if (currentState == 'c' || currentState == 'C'){ //for when the current state is cold
            tempArray[0][0] = (coldProbabilities[0][0] * transitionProbabilities[0][0]) + (coldProbabilities[0][1] * transitionProbabilities[1][0]);
            tempArray[0][1] = (coldProbabilities[0][0] * transitionProbabilities[0][1]) + (coldProbabilities[0][1] * transitionProbabilities[1][1]);
            tempArray[1][0] = (coldProbabilities[1][0] * transitionProbabilities[0][0]) + (coldProbabilities[1][1] * transitionProbabilities[1][0]);
            tempArray[1][1] = (coldProbabilities[1][0] * transitionProbabilities[0][1]) + (coldProbabilities[1][1] * transitionProbabilities[1][1]);
            
            tempArray2[0][0] = (tempArray[0][0] * equiprobable[0][0]) + (tempArray[0][1] * equiprobable[0][1]);
            tempArray2[0][1] = (tempArray[1][0] * equiprobable[0][0]) + (tempArray[1][1] * equiprobable[0][1]);
            
            
            equiprobable[0][0] = tempArray2[0][0];
            equiprobable[0][1] = tempArray2[0][1];

        }
        else if (currentState == 'h' || currentState == 'H'){//for when the current state is hot
            tempArray[0][0] = (hotProbabilities[0][0] * transitionProbabilities[0][0]) + (hotProbabilities[0][1] * transitionProbabilities[1][0]);
            tempArray[0][1] = (hotProbabilities[0][0] * transitionProbabilities[0][1]) + (hotProbabilities[0][1] * transitionProbabilities[1][1]);
            tempArray[1][0] = (hotProbabilities[1][0] * transitionProbabilities[0][0]) + (hotProbabilities[1][1] * transitionProbabilities[1][0]);
            tempArray[1][1] = (hotProbabilities[1][0] * transitionProbabilities[0][1]) + (hotProbabilities[1][1] * transitionProbabilities[1][1]);
            
            tempArray2[0][0] = (tempArray[0][0] * equiprobable[0][0]) + (tempArray[0][1] * equiprobable[0][1]);
            tempArray2[0][1] = (tempArray[1][0] * equiprobable[0][0]) + (tempArray[1][1] * equiprobable[0][1]);
            
            
            equiprobable[0][0] = tempArray2[0][0];
            equiprobable[0][1] = tempArray2[0][1];
            
        }
        else if (currentState == 'w' || currentState == 'W'){// for when the current state is warm
            tempArray[0][0] = (warmProbabilities[0][0] * transitionProbabilities[0][0]) + (warmProbabilities[0][1] * transitionProbabilities[1][0]);
            tempArray[0][1] = (warmProbabilities[0][0] * transitionProbabilities[0][1]) + (warmProbabilities[0][1] * transitionProbabilities[1][1]);
            tempArray[1][0] = (warmProbabilities[1][0] * transitionProbabilities[0][0]) + (warmProbabilities[1][1] * transitionProbabilities[1][0]);
            tempArray[1][1] = (warmProbabilities[1][0] * transitionProbabilities[0][1]) + (warmProbabilities[1][1] * transitionProbabilities[1][1]);
            
            tempArray2[0][0] = (tempArray[0][0] * equiprobable[0][0]) + (tempArray[0][1] * equiprobable[0][1]);
            tempArray2[0][1] = (tempArray[1][0] * equiprobable[0][0]) + (tempArray[1][1] * equiprobable[0][1]);
            
            
            equiprobable[0][0] = tempArray2[0][0];
            equiprobable[0][1] = tempArray2[0][1];
        }
        
    }
    
    float answer = equiprobable[0][0] + equiprobable[0][1];
    
    std::cout << "The probability of observing the sequence ";
    for (int i = 0; i < sequenceSize; i++)
    {
        std::cout << sequence[i] << ",";
        //output the users sequence
    }
    std::cout << " is: " << answer << std::endl;//output the answer
    
}
    
    
    
    
    
    
    

