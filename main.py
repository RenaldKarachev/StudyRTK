import sys

def process_file(pth, flname, step):
    res_list = set() #итоговое множество
    def insert_res(st):
        if st not in res_list:
            res_list.add(st)
    curstr = ''
    with open(pth + flname, 'r') as inf:
        for ln in inf:
            cur_num = True
            ln = curstr + ln.strip()
            while cur_num:
                buf = ln[:step]
                if len(buf) == step:
                    insert_res(buf)
                    ln = ln[1:]
                else:
                    curstr = ln
                    cur_num = False
    with open(pth + flname+'res', 'w') as out:
        for x in res_list:
            out.write(x+'\n')
part = 5

process_file('D:\\programming\\python\\', 'Genome_1-1.txt', part)
process_file('D:\\programming\\python\\', 'Genome_2-1.txt', part)
print('Done')
