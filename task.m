clear
data = readmatrix('log2_new.csv');

% r1 = corr(data(:, 1), data(:, 12), 'type', 'pearson')
for k = 1:11
    r1 = corr(data(:, k), data(:, 12), 'type', 'pearson');
end

port = normalize([data(1:10220, 1:4); data(10222:65532, 1:4)]);
Byte = normalize([data(1:10220, 5); data(10222:65532, 5)]);
other = normalize([data(1:10220, 6:11); data(10222:65532, 6:11)]);
predicator = normalize([port, Byte, other]);

% 1 -> allow
% 2 -> deny
% 3 -> Drop
% 4 -> Reset-Both
response = [data(1:10220, 12); data(10222:65532, 12)];  % Action

R = zeros(65531, 4);

for i = 1:4
    R(response == i, i) = 1;
end