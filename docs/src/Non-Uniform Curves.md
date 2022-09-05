Non-uniform cubic Hermite curves ``\bm{P}(t) \,,\; t \in \langle t_0,t_1 \rangle \,,\; (t_0,t_1) \in \mathbb{R}^2`` are a generalized variant of the previously derived uniform curves which we will also define using control values ``\bm{P}_0``, ``\bm{\dot{P}}_0``, ``\bm{P}_1``, ``\bm{\dot{P}}_1`` where ``\bm{P}(t)`` must satisfy
```math
	\bm{P}_0 = \bm{P}(t_0)
	\;,\quad 
	\bm{\dot{P}}_0 =\bm{\dot{P}}(t_0)
	\;,\quad 
	\bm{P}_1 = \bm{P}(t_1)
	\;,\quad 
	\bm{\dot{P}}_1 =\bm{\dot{P}}(t_1)
```
We will re-use matrices ``\bm{C}`` and ``\bm{M}_H`` when defining the form of non-uniform cubic Hermite curves while introducing the normalization matrix ``\bm{D}`` and selecting a new polynomial basis ``\bm{\psi}`` that is beside ``t`` also a dependent on constants ``t_0`` and ``t_1``
```math
	\bm{P}(t)
	=
	\bm{C} \bm{D}(t_0,t_1) \bm{M}_H \bm{\psi}(t_0,t_1,t)
	\;,\quad 
	t \in \langle t_0,t_1 \rangle
```
where the form of ``\bm{D} = \bm{D}(t_0,t_1)`` is yet to be determined and ``\bm{\psi}(t_0,t_1,t)`` can be written in summation form as
```math
	\psi_k(t_0,t_1,t)
	=
	\phi_k\left(\frac{t-t_0}{t_1-t_0}\right)
	=
	\frac{(t-t_0)^k}{k!\,(t_1-t_0)^k}
```

Although ``l``-th derivative of ``\bm{\psi}(t_0,t_1,t)`` can be derived directly as
```math
	\frac{d^l \psi_k}{dt^l}(t_0,t_1,t)
	=
	\begin{cases}
		\frac{(t-t_0)^{k-l}}{(k-l)!\,(t_1-t_0)^k}, & k \geq l \\
		0, & k < l
	\end{cases}
```
for the purpose of determining the form of ``\bm{D}(t_0,t_1)`` we will also express it using the ``l``-th derivate of ``\bm{\phi}(t)``
```math
	\frac{d^l \psi_k}{dt^l}(t_0,t_1,t)
	=
	\begin{cases}
		\frac{1}{(t_1-t_0)^{l}} \frac{d^l \phi_k}{dt^l}\left(\frac{t-t_0}{t_1-t_0}\right) & ,\; k \geq l \\
		0 & ,\; k < l
	\end{cases}
```

System of equations defining the curve can then be written in matrix form as
```math
	\underbrace{
	\begin{bmatrix}
		\bm{P}_0 & \bm{\dot{P}}_0 & \bm{P}_1 & \bm{\dot{P}}_1
	\end{bmatrix}
	}_{\bm{C}}
	% \bm{C}
	=
	\bm{C}
	\,
	\bm{D}
	\,
	\bm{M}_H
	\,
	\underbrace{
	\begin{bmatrix}
		\bm{\psi}(t_0) & \bm{\dot{\psi}}(t_0) &
		\bm{\psi}(t_1) & \bm{\dot{\psi}}(t_1)
	\end{bmatrix}
	}_{\bm{\Psi}_C}
```
If we define ``\bm{D}(t_0,t_1)`` so that ``\bm{\Psi}_C = \bm{\Phi}_C \bm{D}^{-1}`` equation will be satisfied as from section we know that ``\bm{M}_H = \bm{\Phi}_C^{-1}``. From equation it can then be derived that
```math
	\bm{D}
	=
	\begin{bmatrix}
		1 & 0       & 0 & 0       \\
		0 & t_1-t_0 & 0 & 0       \\
		0 & 0       & 1 & 0       \\
		0 & 0       & 0 & t_1-t_0
	\end{bmatrix}
```
