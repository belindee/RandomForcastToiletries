%run plethora of tests

%compile everything
if strcmpi(computer,'PCWIN') |strcmpi(computer,'PCWIN64')
   compile_windows
else
   compile_linux
end

clear;
clc;

total_train_time=0;
total_test_time=0;

% 

 load data/label55x9
 load data/smp55
 
% %twonorm, N=300, D=2
for j=1:10
	fprintf('%d,',j);
    for i=1:9
        
        % tic�������浱ǰʱ�䣬����ʹ��toc����¼�������ʱ�䡣
        % �����������ʹ�ã��÷����£�
        % tic
        % operations
	    tic;
	    model=classRF_train(smp55(1:55,:),lebel55x9(1:55,i),500);%���Ͻǵġ���ʾ���Ǿ����ת�á�
        total_train_time=toc; 
        toc
        tic;
	    y_hat(:,i) = classRF_predict(smp55(56:57,:),model);
	    total_test_time=total_test_time+toc;	
        %length(x0)Ϊ���еĳ���,���������ж��ٸ�Ԫ��.���x0�Ǿ���Ļ�,�ȷ�˵M��N��,��ôlength����M��N�������������ֵ.
        %temp=length(find(y_hat~=label59))/length(label59);
        %keyboard
    end
end
fprintf('\nnum_tree %d: Avg train time %d, test time %d\n',1000,total_train_time/100,total_test_time/100);


