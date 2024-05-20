import { login, register } from '../common/http/login'
import { router } from '@kit.ArkUI'
import { tokenStore, userStoreWithToken } from '../common/store'

export  interface registerReq{
  name:string
  password:string
}

@Entry
@Component
struct Login {

  @State name:string='Tom'

  @State pass:string='123456'

  @StorageLink("isLogin") login:boolean=false

  @StorageLink("user") user:userStoreWithToken={} as userStoreWithToken

  async onPageShow(): Promise<void> {
  }

  build() {
    Navigation(){

      Column({space:20}){

        TextInput({placeholder:'手机号码/邮箱',text:$$this.name})

        TextInput({placeholder:'密码',text:$$this.pass})

        Button('登录')
          .backgroundColor(Color.Black)
          .fontColor(Color.White)
          .borderRadius(20).width('100%')
          .onClick(async ()=>{

            const res=await login(this.name,this.pass)

            if(res!=undefined){
              this.user=res
              tokenStore.setToken(this.user.token)
              console.log(`user:${JSON.stringify(this.user)}`)
              this.login=true
              router.pushUrl({
                url:'pages/Index'
              })
            }

          })

        Row(){

          Text('忘记密码')
            .fontColor(Color.Gray)

          Text('注册')
            .fontColor(Color.Gray)

        }.width('100%')
        .justifyContent(FlexAlign.SpaceBetween)

      }.height('100%')
      .justifyContent(FlexAlign.Start)
      .width('90%')

    }.title("登录")
    .titleMode(NavigationTitleMode.Mini)

  }
}