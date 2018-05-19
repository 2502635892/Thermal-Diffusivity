%this is a matlab code!
% shou du bo wu guan!
% add hello!
clear all;
N = 500;
EPSILON = 0.05;
diff = 0.0;
mean_ = 0.0;
u = zeros(N,N);
w = zeros(N,N);
for i=1:N
    u(i,1) =100.0;
    u(i,N) = 100.0;
    u(1,i) = 100.0;
    u(N,i) =0.0;
    mean_= mean_+u(i,1)+u(i,N)+u(1,i)+u(N,i);
end
mean_=mean_/(4.0*N);

for i=2:N-1
    for j=2:N-1
        u(i,j) = mean_;
    end
end

while 1
    
    diff =0.0;
    for i=2:N-2
        for j=2:N-1
            w(i,j) = ( u(i-1,j)+u(i+1,j)+u(i,j-1)+u(i,j+1) )/4.0 ;
            if abs(w(i,j) - u(i,j)) > diff
                diff =abs(w(i,j) - u(i,j));
            end
            
            
        end
    end
    if diff <= EPSILON
         break;
    end
     for  i=2:N-1
         for j=2:N-1
             u(i,j) = w(i,j);
         end
     end
      
end

X =zeros(3,N*N);
t=1;
for i=1:N
    for j=1:N
        X(1,t) = i;
         X(2,t) = j ;
          X(3,t) =u(i,j);
          t=t+1;
    end
end

figure
scatter(X(1,:),X(2,:),[],X(3,:))





