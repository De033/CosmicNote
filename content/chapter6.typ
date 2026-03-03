#import "../template.typ": *

= Actor-Critic算法
== 概述
- Actor-Critic算法结合了策略梯度方法和价值函数方法的优点
- Actor：负责选择动作的策略网络，直接输出动作的概率分布
- Critic：负责评估当前策略的价值网络，估计状态价值函数或动作价值函数
== Actor-Critic
- Actor与环境交互，并在Critic的指导下通过策略梯度学习更好的策略
- Critic通过Actor与环境交互收集的数据学习一个价值函数，价值函数用于判断动作选择的好坏
- Critic的更新方式通常采用时序差分方法
$ cal(L)(omega)=1/2 (r+gamma V_omega (s_(t+1))-V_omega (s_t))^2 $<critic-loss>
- 价值函数的梯度
$ nabla_omega cal(L)(omega)=-(r+gamma V_omega (s_(t+1))-V_omega (s_t)) nabla_omega V_omega (s_t) $<critic-gradient>