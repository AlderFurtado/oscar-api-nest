import { Injectable, UnauthorizedException } from '@nestjs/common';
import { JwtService } from '@nestjs/jwt';
import { UsersService } from 'src/users/users.service';

@Injectable()
export class AuthService {
    constructor(private usersService: UsersService, private jwtService: JwtService) { }

    async signIn(username: string, pass: string): Promise<any> {
        const user = await this.usersService.findOne(username);
        console.log({user})
        if (user?.password_hash !== pass) {
            throw new UnauthorizedException();
        }
        const payload = { sub: user.id, username: user.email };
        return {
            // 💡 Here the JWT secret key that's used for signing the payload 
            // is the key that was passsed in the JwtModule
            access_token: await this.jwtService.signAsync(payload),
        };
    }

    async register(username: string, pass: string): Promise<any> {
        //TODO validar se email ja não ta cadastrado
        //TODO validar senha forte
        const user = await this.usersService.create(username, pass)
        const payload = { sub: user?.id, username: user?.email };

        return {
            // 💡 Here the JWT secret key that's used for signing the payload 
            // is the key that was passsed in the JwtModule
            access_token: await this.jwtService.signAsync(payload),
        };
    }

}
