%run plethora of tests

%compile everything
if strcmpi(computer,'PCWIN') |strcmpi(computer,'PCWIN64')
   compile_windows
else
   compile_linux
end

total_train_time=0;
total_test_time=0;

% 

 load data/label59
 load data/sam59
 
% %twonorm, N=300, D=2
for i=1:10
	fprintf('%d,',i);
    % tic�������浱ǰʱ�䣬����ʹ��toc����¼�������ʱ�䡣
    % �����������ʹ�ã��÷����£�
    % tic
    % operations
	tic;
	model=classRF_train(sam59(1:52,:),label59(1:52,:),1500);%���Ͻǵġ���ʾ���Ǿ����ת�á�
    total_train_time=toc; 
    toc
    tic;
	y_hat = classRF_predict(sam59(53:59,:),model);
	total_test_time=total_test_time+toc;	
    %length(x0)Ϊ���еĳ���,���������ж��ٸ�Ԫ��.���x0�Ǿ���Ļ�,�ȷ�˵M��N��,��ôlength����M��N�������������ֵ.
%     temp=length(find(y_hat~=label59))/length(label59);
    %keyboard
end
fprintf('\nnum_tree %d: Avg train time %d, test time %d\n',1000,total_train_time/100,total_test_time/100);


