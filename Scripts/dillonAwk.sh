awk 'BEGIN{
	sum = 0;
}
{
	if ($1 == "Dillon-Gym")
	{
		sum += $3
	}
}
END {
	print sum;
}