#import "../template.typ": *
= 近端策略优化
== 重要性采样
=== 概念
- 重要性采样：通过乘一个重要性权重来修正两个分布间的差距进行采样
=== 具体步骤
+ 假设有一个目标分布$p(x)$，但只能从一个行为分布$q(x)$中采样
+ 计算重要性权重$w(x)=p(x)/q(x)$
+ 使用权重$w(x)$对从$q(x)$中采样的数据进行加权，以估计目标分布$p(x)$下的期望
$ bb(E)_(x ~ p)[f(x)] = bb(E)_(x ~ q)[p(x)/q(x) f(x)] $
== 近端策略优化算法
=== 概述
- 优点：通过限制新旧策略的差异，保证每次更新的稳定性和安全性
=== 近端策略优化惩罚(penalty)
$ J^(theta^k)_("PPO")(theta)=J^(theta^k)(theta)-beta "KL"(theta,theta^k) $<ppo-penalty>
$ J^(theta^k)(theta) approx limits(sum_((s_t,a_t))) (p_theta (a_t|s_t))/(p_(theta^k)(a_t|s_t))A ^(theta^k)(s_t,a_t) $

@ppo-penalty 中$beta$可以根据KL散度的大小动态调整

=== 近端策略优化裁剪(clipping)
$ J^(theta^k)_("PPO2")(theta) approx limits(sum_((s_t,a_t))) min((p_(theta)(a_t|s_t))/(p_(theta^k)(a_t|s_t)), "clip"((p_(theta)(a_t|s_t))/(p_(theta^k)(a_t|s_t)), 1-epsilon, 1+epsilon)) A ^(theta^k)(s_t,a_t) $<ppo-clipping>
@ppo-clipping 中的变量含义：
- $epsilon$：裁剪范围的超参数，通常取值较小（如0.1或0.2）
- clip函数：将比$1+epsilon$大的值裁剪为$1+epsilon$，比$1-epsilon$小的值裁剪为$1-epsilon$
- 裁剪方法通过限制重要性权重的变化范围，防止策略更新过大，从而提高训练的稳定性
