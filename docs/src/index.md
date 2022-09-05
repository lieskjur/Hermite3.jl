# Cubic Hermite Splines

## Uniform Curves

Let ``\bm{P}(t) \,,\; t \in \langle 0,1 \rangle`` be a cubic Hermite curve defined by control values ``\bm{P}_0``, ``\bm{\dot{P}}_0``, ``\bm{P}_1``, ``\bm{\dot{P}}_1`` where ``\bm{P}(t)`` must satisfy
```math
	\bm{P}_0 = \bm{P}(0)
	\;,\quad 
	\bm{\dot{P}}_0 =\bm{\dot{P}}(0)
	\;,\quad 
	\bm{P}_1 = \bm{P}(1)
	\;,\quad 
	\bm{\dot{P}}_1 =\bm{\dot{P}}(1)
```
Such curve can be written in the form
```math
	\bm{P}(t)
	=
	\bm{C} \bm{M}_H \bm{\phi}(t)
	\;,\quad 
	t \in \langle 0,1 \rangle
```
where ``\bm{C}`` is the control matrix
```math
	\bm{C}
	=
	\begin{bmatrix}
		\bm{P}_0 & \bm{\dot{P}}_0 & \bm{P}_1 & \bm{\dot{P}}_1
	\end{bmatrix}
```
``\bm{M}_H`` the basis matrix and ``\bm{\phi}(t)`` the basis polynomial. We will use a basis which can be expressed in the summation form as
```math
	\phi_k(t) = \frac{t^k}{k!}
	\;,\quad 
	k \in \langle 0,3 \rangle
	\,,\;
	k \in \mathbb{N}
```
its ``l``-th derivative being
```math
	\frac{d^l \phi_k}{dt^l}(t)
	=
	\begin{cases}
		\frac{t^{k-l}}{(k-l)!}, & k \geq l \\
		0, & k < l
	\end{cases}
```

To determine the values of ``\bm{M}_H`` we must solve the system of equations which can be written in matrix form as
```math
	\underbrace{
	\begin{bmatrix}
		\bm{P}_0 & \bm{\dot{P}}_0 & \bm{P}_1 & \bm{\dot{P}}_1
	\end{bmatrix}
	}_{\bm{C}}
	=
	\bm{C}
	\,
	\bm{M}_H
	\,
	% \bm{\Phi}_C
	\underbrace{
	\begin{bmatrix}
		\bm{\phi}(0) & \bm{\dot{\phi}}(0) &
		\bm{\phi}(1) & \bm{\dot{\phi}}(1)
	\end{bmatrix}
	}_{\bm{\Phi}_C}
```
from equation it is evident that ``\bm{M}_H`` must satisfy ``\bm{M}_H = \bm{\Phi}_C^{-1}``, therefore
```math
	\bm{M}_H
	=
	\begin{bmatrix}
		1  &  0  & -6  &  12 \\
		0  &  1  & -4  &   6 \\
		0  &  0  &  6  & -12 \\
		0  &  0  & -2  &   6
	\end{bmatrix}
```

## Non-Uniform Curves

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
We will re-use matrices ``\bm{C}`` and ``\bm{M}_H`` when defining the form of non-uniform cubic Hermite curves while introducing the \glsdesc{D} ``\bm{D}`` and selecting a new \glslink{psi}{polynomial basis} ``\bm{psi}`` that is beside ``t`` also a dependent on constants ``t_0`` and ``t_1``
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

## Splines

A ``\mathbb{C}^1`` continuous cubic Hermite spline can be created by defining values
```math
	\bm{P}_i = \bm{P}(t_i)
	\,,\;
	\bm{\dot{P}}_i = \bm{\dot{P}}(t_i)
	\;,\quad 
	i \in \{0,\ldots,N\}
```
and constructing ``N`` non-uniform cubic Hermite curves
```math
	\bm{P}_{i-1,i}(t)
	=
	\begin{bmatrix}
		\bm{P}_{i-1} & \bm{\dot{P}}_{i-1} & \bm{P}_i & \bm{\dot{P}}_i
	\end{bmatrix}
	\bm{M}_H
	\bm{D}(t_{i-1},t_i)
	\,
	\bm{\psi}(t_{i-1},t_i,t)
```
for
```math
	t \in \langle t_{i-1}, t_i \rangle
	\;,\quad 
	i \in \{1,\ldots,N\} 
```
where their ``l``-th derivate can be simply obtained by substituting ``\bm{\psi}(t_{i-1},t_i,t)`` for ``\frac{d^l \bm{\psi}}{dt^l}(t_{i-1},t_i,t)``.