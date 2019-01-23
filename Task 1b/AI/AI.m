filename = 'csv.dat';
M = csvread(filename,1,0); %read in csv file

Smoking = M(:,1);
Yellow_Fingers = M(:,2);
Anxiety = M(:,3);
Peer_Pressure = M(:,4);
Genetics = M(:,5);
Attention_Disorder = M(:,6);
BED = M(:,7);
Car_Accident = M(:,8);
Fatigue = M(:,9);
Allergy = M(:,10);
Coughing = M(:,11);
Lung_Cancer = M(:,12);

%the following is to generate the probabilities of variables with no
%parents
ProbAnxiety = (sum(Anxiety) + 1)/(2000 + 2);
ProbPeerPressure = (sum(Peer_Pressure) + 1)/(2000 + 2);
ProbGenetics = (sum(Genetics) + 1)/(2000 + 2);
ProbAllergy = (sum(Allergy) + 1)/(2000 + 2);
ProbBED = (sum(BED) + 1)/(2000 + 2);
count = 0;
newcount = 0;

% the following is to generate P(Smoking=T|Peer Pressure=F, Anxiety=F)
for i = 1:2000
    if (Smoking(i) == 1 && Anxiety(i) == 0 && Peer_Pressure(i) == 0)
        count = count + 1;
    elseif (Smoking(i) == 0 && Anxiety(i) == 0 && Peer_Pressure(i) == 0)
        newcount = newcount + 1;    
    end    
end
ProbSgivPPfandAnxf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Smoking=T|Peer Pressure=T, Anxiety=F)

for i = 1:2000
    if (Smoking(i) == 1 && Anxiety(i) == 0 && Peer_Pressure(i) == 1)
        count = count + 1;
    elseif (Smoking(i) == 0 && Anxiety(i) == 0 && Peer_Pressure(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbSgivPPTandAnxf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Smoking=T|Peer Pressure=F, Anxiety=T)

for i = 1:2000
    if (Smoking(i) == 1 && Anxiety(i) == 1 && Peer_Pressure(i) == 0)
        count = count + 1;
    elseif (Smoking(i) == 0 && Anxiety(i) == 1 && Peer_Pressure(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbSgivPPfandAnxT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Smoking=T|Peer Pressure=T, Anxiety=T)

for i = 1:2000
    if (Smoking(i) == 1 && Anxiety(i) == 1 && Peer_Pressure(i) == 1)
        count = count + 1;
    elseif (Smoking(i) == 0 && Anxiety(i) == 1 && Peer_Pressure(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbSgivPPTandAnxT = count/(count+newcount);
count = 0;
newcount = 0;

% The following is to generate P(Yellow Fingers = T| Smoking = F)

for i = 1:2000
    if (Yellow_Fingers(i) == 1 && Smoking(i) == 0)
        count = count + 1;
    elseif (Yellow_Fingers(i) == 0 && Smoking(i) == 0) 
        newcount = newcount + 1;
    end
end 

ProbYFgivSf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Yellow Fingers = T| Smoking = T)

for i = 1:2000
    if (Yellow_Fingers(i) == 1 && Smoking(i) == 1)
        count = count + 1;
    elseif (Yellow_Fingers(i) == 0 && Smoking(i) == 1) 
        newcount = newcount + 1;
    end
end 

ProbYFgivST = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Lung cancer=T|Genetics=F, Smoking=F)

for i = 1:2000
    if (Lung_Cancer(i) == 1 && Genetics(i) == 0 && Smoking(i) == 0)
        count = count + 1;
    elseif (Lung_Cancer(i) == 0 && Genetics(i) == 0 && Smoking(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbLCgivGfandSf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Lung cancer=T|Genetics=T, Smoking=F)

for i = 1:2000
    if (Lung_Cancer(i) == 1 && Genetics(i) == 1 && Smoking(i) == 0)
        count = count + 1;
    elseif (Lung_Cancer(i) == 0 && Genetics(i) == 1 && Smoking(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbLCgivGTandSf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Lung cancer=T|Genetics=F, Smoking=T)

for i = 1:2000
    if (Lung_Cancer(i) == 1 && Genetics(i) == 0 && Smoking(i) == 1)
        count = count + 1;
    elseif (Lung_Cancer(i) == 0 && Genetics(i) == 0 && Smoking(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbLCgivGfandST = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% the following is to generate P(Lung cancer=T|Genetics=T, Smoking=T)

for i = 1:2000
    if (Lung_Cancer(i) == 1 && Genetics(i) == 1 && Smoking(i) == 1)
        count = count + 1;
    elseif (Lung_Cancer(i) == 0 && Genetics(i) == 1 && Smoking(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbLCgivGTandST = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Attention Disorder = T| Genetics = F)

for i = 1:2000
    if (Attention_Disorder(i) == 1 && Genetics(i) == 0)
        count = count + 1;
    elseif (Attention_Disorder(i) == 0 && Genetics(i) == 0) 
        newcount = newcount + 1;
    end
end 

ProbADgivGf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Attention Disorder = T| Genetics = T)

for i = 1:2000
    if (Attention_Disorder(i) == 1 && Genetics(i) == 1)
        count = count + 1;
    elseif (Attention_Disorder(i) == 0 && Genetics(i) == 1) 
        newcount = newcount + 1;
    end
end 

ProbADgivGT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Coughing=T|Allergy=F, Lung cancer=F)

for i = 1:2000
    if (Coughing(i) == 1 && Allergy(i) == 0 && Lung_Cancer(i) == 0)
        count = count + 1;
    elseif (Coughing(i) == 0 && Allergy(i) == 0 && Lung_Cancer(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbCgivAllfandLCf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Coughing=T|Allergy=T, Lung cancer=F)

for i = 1:2000
    if (Coughing(i) == 1 && Allergy(i) == 1 && Lung_Cancer(i) == 0)
        count = count + 1;
    elseif (Coughing(i) == 0 && Allergy(i) == 1 && Lung_Cancer(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbCgivAllTandLCf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Coughing=T|Allergy=F, Lung cancer=T)

for i = 1:2000
    if (Coughing(i) == 1 && Allergy(i) == 0 && Lung_Cancer(i) == 1)
        count = count + 1;
    elseif (Coughing(i) == 0 && Allergy(i) == 0 && Lung_Cancer(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbCgivAllfandLCT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Coughing=T|Allergy=T, Lung cancer=T)

for i = 1:2000
    if (Coughing(i) == 1 && Allergy(i) == 1 && Lung_Cancer(i) == 1)
        count = count + 1;
    elseif (Coughing(i) == 0 && Allergy(i) == 1 && Lung_Cancer(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbCgivAllTandLCT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Fatigue=T|Lung cancer=F, Coughing = F)

for i = 1:2000
    if (Fatigue(i) == 1 && Lung_Cancer(i) == 0 && Coughing(i) == 0)
        count = count + 1;
    elseif (Fatigue(i) == 0 && Lung_Cancer(i) == 0 && Coughing(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbFgivLCfandCf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Fatigue=T|Lung cancer=T, Coughing = F)

for i = 1:2000
    if (Fatigue(i) == 1 && Lung_Cancer(i) == 1 && Coughing(i) == 0)
        count = count + 1;
    elseif (Fatigue(i) == 0 && Lung_Cancer(i) == 1 && Coughing(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbFgivLCTandCf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Fatigue=T|Lung cancer=F, Coughing = T)

for i = 1:2000
    if (Fatigue(i) == 1 && Lung_Cancer(i) == 0 && Coughing(i) == 1)
        count = count + 1;
    elseif (Fatigue(i) == 0 && Lung_Cancer(i) == 0 && Coughing(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbFgivLCfandCT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Fatigue=T|Lung cancer=T, Coughing = T)

for i = 1:2000
    if (Fatigue(i) == 1 && Lung_Cancer(i) == 1 && Coughing(i) == 1)
        count = count + 1;
    elseif (Fatigue(i) == 0 && Lung_Cancer(i) == 1 && Coughing(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbFgivLCTandCT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Car_Accident=T|Attention_Disorder=F, Fatigue = F)

for i = 1:2000
    if (Car_Accident(i) == 1 && Attention_Disorder(i) == 0 && Fatigue(i) == 0)
        count = count + 1;
    elseif (Car_Accident(i) == 0 && Attention_Disorder(i) == 0 && Fatigue(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbCAgivADfandFf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Car_Accident=T|Attention_Disorder=T, Fatigue = F)

for i = 1:2000
    if (Car_Accident(i) == 1 && Attention_Disorder(i) == 1 && Fatigue(i) == 0)
        count = count + 1;
    elseif (Car_Accident(i) == 0 && Attention_Disorder(i) == 1 && Fatigue(i) == 0)
        newcount = newcount + 1;    
    end    
end

ProbCAgivADTandFf = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Car_Accident=T|Attention_Disorder=F, Fatigue = T)

for i = 1:2000
    if (Car_Accident(i) == 1 && Attention_Disorder(i) == 0 && Fatigue(i) == 1)
        count = count + 1;
    elseif (Car_Accident(i) == 0 && Attention_Disorder(i) == 0 && Fatigue(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbCAgivADfandFT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;

% The following is to generate P(Car_Accident=T|Attention_Disorder=T, Fatigue = T)

for i = 1:2000
    if (Car_Accident(i) == 1 && Attention_Disorder(i) == 1 && Fatigue(i) == 1)
        count = count + 1;
    elseif (Car_Accident(i) == 0 && Attention_Disorder(i) == 1 && Fatigue(i) == 1)
        newcount = newcount + 1;    
    end    
end

ProbCAgivADTandFT = (count + 1)/(count+newcount+2);
count = 0;
newcount = 0;


samples = zeros(1000000,9); % a 2d array to store all the samples in

%the following generates 1 million samples which conform to the desired
%parameteres
for i = 1:1000000
    randomNumbers = [rand rand rand rand rand rand rand rand]; % generate the random samples
    %sampling anxiety
    if randomNumbers(1) <= ProbAnxiety
        samples(i,1) = 1;
    else
        samples(i,1) = 0;
    end    
     %sampling peer pressure
    if randomNumbers(2) <= ProbPeerPressure
        samples(i,2) = 1;
    else
        samples(i,2) = 0;
    end    
     %sampling Genetics
    if randomNumbers(3) <= ProbGenetics
        samples(i,3) = 1;
    else
        samples(i,3) = 0;
    end    
     %sampling Allergy
    if randomNumbers(4) <= ProbAllergy
        samples(i,4) = 1;
    else
        samples(i,4) = 0;
    end    
     %sampling Smoking
    if samples(i,1) == 0 && samples(i,2) == 0
       if randomNumbers(5) <= ProbSgivPPfandAnxf
           samples(i,5) = 1;
       else
           samples(i,5) = 0;
       end    
    elseif samples(i,1) == 0 && samples(i,2) == 1
        if randomNumbers(5) <= ProbSgivPPTandAnxf
           samples(i,5) = 1;
       else
           samples(i,5) = 0;
       end    
    elseif samples(i,1) == 1 && samples(i,2) == 0
        if randomNumbers(5) <= ProbSgivPPfandAnxT
           samples(i,5) = 1;
       else
           samples(i,5) = 0;
       end    
    elseif samples(i,1) == 1 && samples(i,2) == 1   
        if randomNumbers(5) <= ProbSgivPPTandAnxT
           samples(i,5) = 1;
       else
           samples(i,5) = 0;
       end    
    end
    
     %sampling Lung Cancer
    if samples(i,3) == 0 && samples(i,5) == 0
       if randomNumbers(6) <= ProbLCgivGfandSf
           samples(i,6) = 1;
       else
           samples(i,6) = 0;
       end    
    elseif samples(i,3) == 0 && samples(i,5) == 1
        if randomNumbers(6) <= ProbLCgivGfandST
           samples(i,6) = 1;
       else
           samples(i,6) = 0;
       end    
    elseif samples(i,3) == 1 && samples(i,5) == 0
        if randomNumbers(6) <= ProbLCgivGTandSf
           samples(i,6) = 1;
       else
           samples(i,6) = 0;
       end    
    elseif samples(i,3) == 1 && samples(i,5) == 1   
        if randomNumbers(6) <= ProbLCgivGTandST
           samples(i,6) = 1;
       else
           samples(i,6) = 0;
       end    
    end
    
    %force coughing to be true
    if samples(i,4) == 0 && samples(i,6) == 0
        samples(i,7) = 1;
        samples(i,9) = ProbCgivAllfandLCf;
    elseif samples(i,4) == 0 && samples(i,6) == 1
        samples(i,7) = 1;
        samples(i,9) = ProbCgivAllfandLCT;
    elseif samples(i,4) == 1 && samples(i,6) == 0
        samples(i,7) = 1;
        samples(i,9) = ProbCgivAllTandLCf; 
    elseif samples(i,4) == 1 && samples(i,6) == 1   
        samples(i,7) = 1;
        samples(i,9) = ProbCgivAllTandLCT;
         
    end
    %force fatigue to be true 
    if samples(i,6) == 0 && samples(i,7) == 1
       samples(i,8) = 1;
       samples(i,9) = samples(i,9) * ProbFgivLCfandCT;   
    elseif samples(i,6) == 1 && samples(i,7) == 1   
       samples(i,8) = 1;
       samples(i,9) = samples(i,9) *  ProbFgivLCTandCT;   
    
    end
    
end  

topweight = 0;
bottomweight = 0;

%the following calculates the weights of the samples that match the query
for i = 1:1000000
    if (samples(i,5) == 1 && samples(i,7) == 1 && samples(i,8) == 1)
        count = count + 1;
        topweight = topweight + samples(i,9);
    elseif (samples(i,5) == 0 && samples(i,7) == 1 && samples(i,8) == 1)
        newcount = newcount + 1;
        bottomweight = bottomweight + samples(i,9);
    end    
end

bottomweight = bottomweight + topweight; %sum of all weights
ProbSmokinggivCoughingTrueandFatigueT =  topweight/bottomweight;%estimate of probability

disp(ProbSmokinggivCoughingTrueandFatigueT); 



