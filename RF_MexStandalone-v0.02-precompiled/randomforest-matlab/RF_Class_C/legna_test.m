%% �������ɭ��˼�����Ϸ��������

%% ��ջ�������
%clear all
clc
warning ('off');

%% ��������
load data.mat
% �������ѵ����/���Լ�
a = randperm(569);%��1��569��Щ��������ҵõ���һ���������С�
Train = data(a(1:500),:);
Test = data(a(501:end),:);
% ѵ������
P_train = Train(:,3:end);
T_train = Train(:,2);
% ��������
P_test = Test(:,3:end);
T_test = Test(:,2);

%% �������ɭ�ַ�����
model = classRF_train(P_train,T_train);

%% �������
[T_sim,votes] = classRF_predict(P_test,model);