# eLegionersHack

Репозиторий команды Dungeon Masters


<img src="https://github.com/kelbin/eLegionersHack/blob/dev/Resoureses/animation.mp4" width="250">


## Архитектура

VIP(View-Interactor-Presenter) aka Clean Swift

Почему?

- От мастера архитектур
- Не требует либ или инфрастуктуры
- Подходит для тонких клиентов, как приложение для сотрудников

![alt text](https://github.com/kelbin/eLegionersHack/blob/dev/Resoureses/arch.jpeg?raw=true)

В качестве менеджера зависимостей - SPM

Верстка - SwiUI (Быстрее реализуется)

Модуляризация -  Swinject

## Установка

```
pod install
```

Далее требуется добавить необходимые пакеты

-Swinject
-Snapkit
-Firebase
