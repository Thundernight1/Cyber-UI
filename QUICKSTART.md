# ⚡ Cyber-UI Hızlı Başlangıç Rehberi

## 🎯 En Hızlı Başlangıç (10 Saniye)

### Linux/Mac:
```bash
./start.sh
```

### Windows:
```bash
start.bat
```

Script size iki seçenek sunacak:
- **Seçenek 1**: Normal Mod (Tek terminal)
- **Seçenek 2**: Full Mod (3 terminal paralel çalışma)

---

## 🚀 Manuel Başlangıç Seçenekleri

### Opsiyon 1: Tek Komut ile Her Şey
```bash
npm run start:all
```
Bu komut:
1. ✅ Tüm bağımlılıkları yükler
2. ✅ 3 terminal açar (Dev, Type Check, Monitor)
3. ✅ Otomatik olarak başlatır

### Opsiyon 2: Sadece Geliştirme Modu
```bash
npm install    # İlk kez çalıştırıyorsanız
npm run dev    # Development server başlat
```

### Opsiyon 3: Full Development Modu (3 Terminal)
```bash
npm install              # Bağımlılıkları yükle
npm run dev:full        # 3 terminal modunu başlat
```

---

## 🖥️ Terminal Modları Nedir?

### 🔵 Terminal 1 - Development Server
- Vite dev server çalışır
- Hot reload aktif
- Port: `http://localhost:5173`

### 🟣 Terminal 2 - Type Checker
- TypeScript hatalarını anlık izler
- Watch modda çalışır
- Kodunuz hatalıysa hemen bildirir

### 🟢 Terminal 3 - Monitor
- Sistem durumunu gösterir
- Log izleme
- Geliştirme bilgileri

---

## 📋 İlk Kurulum Adımları

### 1️⃣ Depoyu Klonla
```bash
git clone <repo-url>
cd Cyber-UI
```

### 2️⃣ Environment Ayarla
```bash
# .env.local dosyası oluştur
cp .env.example .env.local

# API anahtarını ekle (nano, vim veya favori editörünüzle)
nano .env.local
```

`.env.local` içeriği:
```env
GEMINI_API_KEY=AIza...  # Buraya kendi API anahtarınızı yazın
```

### 3️⃣ Başlat!
```bash
./start.sh        # Linux/Mac
# veya
start.bat         # Windows
```

---

## 🎨 Kullanım Senaryoları

### Senaryo 1: Hızlı Test
```bash
npm run dev
```
Tarayıcıda aç: `http://localhost:5173`

### Senaryo 2: Professional Development
```bash
npm run dev:full
```
3 terminal açılır, her biri farklı görevi izler.

### Senaryo 3: Production Build Test
```bash
npm run build
npm run preview
```
Production build'i test et.

### Senaryo 4: Type Checking
```bash
npm run type-check         # Tek seferlik
npm run type-check:watch   # Sürekli izleme
```

---

## 🔧 Önemli Komutlar

| Komut | Ne Yapar? |
|-------|-----------|
| `npm install` | Bağımlılıkları yükler |
| `npm run dev` | Dev server başlat (tek terminal) |
| `npm run dev:full` | Full mod (3 terminal) |
| `npm run start:all` | Install + Full mod |
| `npm run build` | Production build |
| `npm run preview` | Build önizleme |
| `npm run type-check` | Type kontrolü |

---

## 🐛 Sorun Giderme

### "Port 5173 already in use" Hatası
```bash
# Linux/Mac
lsof -ti:5173 | xargs kill -9

# Windows (PowerShell)
Get-Process -Id (Get-NetTCPConnection -LocalPort 5173).OwningProcess | Stop-Process

# Sonra tekrar dene
npm run dev
```

### "Module not found" Hatası
```bash
rm -rf node_modules package-lock.json
npm install
```

### TypeScript Hataları
```bash
npm run type-check
# Hataları gör ve düzelt
```

### Git Push Sorunları
Branch'iniz `claude/update-claude-md-TqZmD` olmalı:
```bash
git checkout claude/update-claude-md-TqZmD
git push -u origin claude/update-claude-md-TqZmD
```

---

## 💡 Pro İpuçları

### VS Code Kullanıcıları
1. `Ctrl+Shift+P` tuşlarına basın
2. "Tasks: Run Task" yazın
3. "Start All Services" seçin
4. ✅ Otomatik 3 terminal açılır!

### Tmux Kullanıcıları
```bash
tmux new-session -s cyber \; \
  send-keys 'npm run dev' C-m \; \
  split-window -h \; \
  send-keys 'npm run type-check:watch' C-m \; \
  split-window -v \; \
  send-keys 'echo "Cyber-UI Active"' C-m
```

### Screen Kullanıcıları
```bash
screen -dmS cyber-dev bash -c 'npm run dev'
screen -dmS cyber-type bash -c 'npm run type-check:watch'
screen -list  # Açık screen'leri gör
```

---

## 📚 Daha Fazla Bilgi

Detaylı bilgi için `CLAUDE.MD` dosyasına bakın:
```bash
cat CLAUDE.MD
# veya
less CLAUDE.MD
```

---

## ✅ Checklist

İlk kez kullanıyorsanız:

- [ ] Node.js yüklü (v18+)
- [ ] Git yüklü
- [ ] Repo klonlandı
- [ ] `npm install` çalıştırıldı
- [ ] `.env.local` oluşturuldu
- [ ] `GEMINI_API_KEY` eklendi
- [ ] `npm run dev` veya `npm run dev:full` çalıştırıldı
- [ ] Tarayıcıda `http://localhost:5173` açıldı

Hepsi ✅ ise: **Tebrikler! Artık geliştirmeye başlayabilirsiniz! 🎉**

---

**İyi Kodlamalar! 🚀**
