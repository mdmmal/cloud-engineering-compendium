# store cpu_usage = 87.6666666
cpu_storage = float(87.6666666)
# store memory_usage = 43.3333333
memory_usage = float(43.3333333)
# store disk_usage = 91.0
disk_usage = 91.0
# store bytes_transferred = 1048576
bytes_transferred = 1048576

# print cpu, memory, disk each on their own line rounded to 2 decimal places
print(f"CPU:    {cpu_storage:.2f}%")
print(f"Memory: {memory_usage:.2f}%")
print(f"Disk:   {disk_usage:.2f}%")
print(f"Bytes:  {bytes_transferred:,}")


# print bytes with comma formatting (1,048,576)