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