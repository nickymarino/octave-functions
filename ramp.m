function f = ramp(t)
	f = (sign(t) + 1) * 0.5;
	f = f .* t;
end
