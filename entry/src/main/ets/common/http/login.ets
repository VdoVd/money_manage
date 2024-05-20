import { httpClass } from '../req'
import { promptAction } from '@kit.ArkUI'
import { userStoreWithToken } from '../store'

export const register = async (name:string,password:string) =>{
  let url=`/register?name=${name}&password=${password}`
  const res=await httpClass.get<boolean>(url)
  if(res){
    promptAction.showToast({message:'成功成功'})
    return true
  }else{
    promptAction.showToast({message:'注册失败'})
    return false
  }
}

export interface loginReq {
  name:string
  password:string
}

export const login = async (name:string,password:string) =>{
  let obj:loginReq ={
    name:name,
    password:password
  }
  const res=await httpClass.post<userStoreWithToken>('/login',obj)
  if(res!=undefined){
    promptAction.showToast({message:'登录成功'})
    return res
  }else{
    promptAction.showToast({message:'登录失败'})
    return res
  }
}

