import { userRes } from './data'

export class allStore{

}

export class tokenStore{

  private static token:string

  public static setToken(token:string){
    console.log(`token:${token}`)
    tokenStore.token=token
  }

  public static getToken(){
    return tokenStore.token
  }

}


export class userStoreWithToken implements userRes{

  id: number=0
  name: string=''
  age: number=0
  email: string=''
  password: string=''
  token:string=''

}




