#import "../template.typ": *

= 策略梯度
== 策略梯度算法
- 策略记作$pi$，参数为$theta$，即$pi_theta$。策略梯度算法的核心思想是直接对策略进行参数化，并通过梯度上升的方法来优化策略参数$theta$，以最大化预期累积奖励。
- 轨迹$tau$：环境输出与演员输出动作的组合
- 某条轨迹$tau$发生的概率 $ P(tau) = p(s_1)limits(product)_(t=1)^T p_theta (a_t|s_t)p (s_(t+1)|s_t,a_t) $
#tip("提示")[依次计算环境输出和相应演员采取的动作发生的概率，乘积即为轨迹发生的概率。]
== 策略梯度
- 目标函数：$J(theta) = bb(E)_(s_0)[V^(pi_0)(s_0)]$
- 目标函数表示在参数为$theta$的策略$pi_theta$下，智能体从初始状态$s_0$开始，所能获得的预期累积奖励的期望值。
- 所以为了优化目标函数，我们需要计算目标函数关于策略参数$theta$的梯度，即策略梯度$nabla_(theta) J(theta)$。
$ nabla_theta J(theta)=bb(E)_(pi_0)[Q^(pi_0)(s,a) nabla_theta log pi_theta(a|s)] $<gradient>
#tip("思路")[@gradient 中$Q$项表示对应优化的权重，$nabla log pi$项表示策略优化的方向]
- 策略梯度定理表明，策略梯度可以通过对策略的对数概率进行求导，并乘以对应的动作价值函数$Q$来计算。