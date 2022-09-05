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
``\bm{M}_H`` the basis matrix and ``\bm{\phi}(t)`` the basis polynomial
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
		\frac{t^{k-l}}{(k-l)!} & k \geq l \\
		0 & k < l
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
