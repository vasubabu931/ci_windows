import xlrd
import os
import sys

#定义一个函数，带有4个参数
#x 表示要更新的文件名称
#y 表示要被替换的内容
#z 表示 替换后的内容
#s 默认参数为 1 表示只替换第一个匹配到的字符串
# 如果参数为 s = 'g' 则表示全文替换

#根据 关键字查找所在的行并替换此行
def string_switch(x,y,z,s=1):
    with open(x, "r", encoding="utf-8") as f:
        #readlines以列表的形式将文件读出
        lines = f.readlines()
 
    with open(x, "w", encoding="utf-8") as f_w:
        #定义一个数字，用来记录在读取文件时在列表中的位置
        n = 0
        #默认选项，只替换第一次匹配到的行中的字符串
        if s == 1:
            for line in lines:
                if y in line:
                    line = line.replace(line,z)
                    f_w.write(line+'\n')                   
                    n += 1
                    break
                f_w.write(line)
                n += 1
            #将剩余的文本内容继续输出
            for i in range(n,len(lines)):
                f_w.write(lines[i])
        #全局匹配替换
        elif s == 'g':
            for line in lines:
                if y in line:
                    line = line.replace(line,z)
                f_w.write(line+'\n')
#替换关键字为指定内容
def string_replace(x,y,z,s=1):
    with open(x, "r", encoding="utf-8") as f:
        #readlines以列表的形式将文件读出
        lines = f.readlines()
 
    with open(x, "w", encoding="utf-8") as f_w:
        #定义一个数字，用来记录在读取文件时在列表中的位置
        n = 0
        #默认选项，只替换第一次匹配到的行中的字符串
        if s == 1:
            for line in lines:
                if y in line:
                    line = line.replace(y,z)
                    f_w.write(line)                   
                    n += 1
                    break
                f_w.write(line)
                n += 1
            #将剩余的文本内容继续输出
            for i in range(n,len(lines)):
                f_w.write(lines[i])
        #全局匹配替换
        elif s == 'g':
            for line in lines:
                if y in line:
                    line = line.replace(y,z)
                f_w.write(line)



if __name__=="__main__":
    # read excel config
    data = xlrd.open_workbook('c:\\ProjectTools\config.xlsx')
    sheet1=None
    if sys.argv[1]=="u":
        sheet1 = data.sheet_by_name('configUpdate')

    if sys.argv[1]=="d":
        sheet1 = data.sheet_by_name('configDefault')
    #nrows = sheet.nrows
    #nclos=sheet.ncols

    #mongodbPort=str(int(sheet1.cell(1,0).value))
    mongodbName = sheet1.cell(1,1).value
    mongodbPassword = sheet1.cell(2,1).value

    #elasticsearchPort = str(int(sheet1.cell(1,1).value))
    elasticsearchName = sheet1.cell(1,2).value
    elasticsearchPassword = sheet1.cell(2,2).value

    RabbitmqName = sheet1.cell(1,3).value
    RabbitmqPassword = sheet1.cell(2,3).value
    RabbitmqPort = str(int(sheet1.cell(3,3).value))

    #RedisName = sheet1.cell(1,3).value
    RedisPassword = sheet1.cell(2,4).value
    RedisPort = str(int(sheet1.cell(3,4).value))

    fscName = sheet1.cell(1,5).value
    fscPassword = sheet1.cell(2,5).value
    fscPort = str(int(sheet1.cell(3,5).value))

    licensePort = str(int(sheet1.cell(3,6).value))

    #read file path
    fsc_path="c:\\Install\FSC\setup.iss"
    fe_path="C:\\Install\FE\setup.iss"
    ie_path="C:\\Install\IE\setup.iss"
    mq_path="C:\\Install\RABBITMQ\setup.iss"
    redis_path="C:\\Install\REDIS\setup.iss"

    print("change FSC config")
    string_switch(fsc_path,"svFSCname","svFSCname="+fscName)
    string_switch(fsc_path,"svUname","svUname="+fscName)
    string_switch(fsc_path,"svPassword","svPassword="+fscPassword)
    string_switch(fsc_path,"svConfirmPassword=","svConfirmPassword="+fscPassword)
    string_switch(fsc_path,"svInsideport=","svInsideport="+fscPort)

    string_switch(fsc_path,"MongoDbUsername","MongoDbUsername="+mongodbName)
    string_switch(fsc_path,"MongoDbPassword","MongoDbPassword="+mongodbPassword)

    string_switch(fsc_path,"RabbitMqUsername","RabbitMqUsername="+RabbitmqName)
    string_switch(fsc_path,"RabbitMqPassword","RabbitMqPassword="+RabbitmqPassword)
    string_switch(fsc_path,"RabbitMqPort","RabbitMqPort="+RabbitmqPort)

    string_switch(fsc_path,"RedisPassword","RedisPassword="+RedisPassword)
    string_switch(fsc_path,"RedisPort","RedisPort="+RedisPort)

    print("change FE config")
    string_switch(fe_path,"MongoDbUsername","MongoDbUsername="+mongodbName)
    string_switch(fe_path,"MongoDbPassword","MongoDbPassword="+mongodbName)

    string_switch(fe_path,"RabbitMqUsername","RabbitMqUsername="+RabbitmqName)
    string_switch(fe_path,"RabbitMqPassword","RabbitMqPassword="+RabbitmqPassword)
    string_switch(fe_path,"RabbitMqPort","RabbitMqPort="+RabbitmqPort)

    print("change IE config")
    string_switch(ie_path,"MongoDbUsername","MongoDbUsername="+mongodbName)
    string_switch(ie_path,"MongoDbPassword","MongoDbPassword="+mongodbName)
    #string_replace(ie_path,"27017",mongodbPort,"g")

    string_switch(ie_path,"SearchUsername","SearchUsername="+elasticsearchName)
    string_switch(ie_path,"SearchPassword","SearchPassword="+elasticsearchPassword)
    #string_replace(ie_path,"9200",elasticsearchPort,"g")

    string_switch(ie_path,"RabbitMqUsername","RabbitMqUsername="+RabbitmqName)
    string_switch(ie_path,"RabbitMqPassword","RabbitMqPassword="+RabbitmqPassword)
    string_switch(ie_path,"RabbitMqPort","RabbitMqPort="+RabbitmqPort)

    string_switch(ie_path,"RedisPassword","RedisPassword="+RedisPassword)
    string_switch(ie_path,"RedisPort","RedisPort="+RedisPort)

    string_switch(ie_path,"LicenseAgentPort","LicenseAgentPort="+licensePort)

    print("chang RABBITMQ config")
    string_switch(mq_path,"RabbitMqUsername","RabbitMqUsername="+RabbitmqName)
    string_switch(mq_path,"RabbitMqPassword","RabbitMqPassword="+RabbitmqPassword)
    string_switch(mq_path,"RabbitMqConfirmPassword","RabbitMqConfirmPassword="+RabbitmqPassword)
    string_switch(mq_path,"RabbitMqLocalPort","RabbitMqLocalPort="+RabbitmqPort)

    print("change REDIS config")
    string_switch(redis_path,"redisPassword","redisPassword="+RedisPassword)
    string_switch(redis_path,"redisConfirmPassword","redisConfirmPassword="+RedisPassword)
    string_switch(redis_path,"redisPort","redisPort="+RedisPort)

    




