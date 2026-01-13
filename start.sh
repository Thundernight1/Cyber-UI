#!/bin/bash

# Cyber-UI Startup Script
# Bu script otomatik olarak tüm bağımlılıkları yükler ve sistemi başlatır

echo "🚀 Cyber-UI Development Environment"
echo "===================================="
echo ""

# Renk kodları
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
RED='\033[0;31m'
NC='\033[0m' # No Color

# Node.js kontrolü
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js bulunamadı! Lütfen Node.js yükleyin.${NC}"
    echo "   İndirme linki: https://nodejs.org/"
    exit 1
fi

echo -e "${GREEN}✅ Node.js bulundu: $(node --version)${NC}"
echo -e "${GREEN}✅ NPM bulundu: $(npm --version)${NC}"
echo ""

# .env.local kontrolü
if [ ! -f .env.local ]; then
    echo -e "${YELLOW}⚠️  .env.local dosyası bulunamadı!${NC}"
    echo -e "${BLUE}📝 .env.example dosyasından kopyalanıyor...${NC}"
    cp .env.example .env.local
    echo ""
    echo -e "${YELLOW}⚠️  ÖNEMLI: .env.local dosyasını düzenleyip GEMINI_API_KEY ekleyin!${NC}"
    echo ""
fi

# node_modules kontrolü
if [ ! -d "node_modules" ]; then
    echo -e "${BLUE}📦 Bağımlılıklar yükleniyor...${NC}"
    npm install
    echo ""
else
    echo -e "${GREEN}✅ Bağımlılıklar zaten yüklü${NC}"
    echo -e "${BLUE}💡 Güncellemek için: npm install${NC}"
    echo ""
fi

# Çoklu terminal modunu sor
echo "Nasıl başlatmak istersiniz?"
echo ""
echo "1) 🚀 Normal Mod (Tek terminal - sadece dev server)"
echo "2) 🔥 Full Mod (3 terminal - dev server + type checker + monitor)"
echo ""
read -p "Seçiminiz (1-2): " choice

case $choice in
    1)
        echo ""
        echo -e "${GREEN}🚀 Normal mod başlatılıyor...${NC}"
        echo -e "${BLUE}   Development server: http://localhost:5173${NC}"
        echo ""
        npm run dev
        ;;
    2)
        echo ""
        echo -e "${GREEN}🔥 Full mod başlatılıyor...${NC}"
        echo -e "${BLUE}   Terminal 1: Development Server${NC}"
        echo -e "${BLUE}   Terminal 2: Type Checker${NC}"
        echo -e "${BLUE}   Terminal 3: Monitor${NC}"
        echo ""
        # concurrently kurulu mu kontrol et
        if ! npm list concurrently &> /dev/null; then
            echo -e "${YELLOW}📦 concurrently yükleniyor...${NC}"
            npm install --save-dev concurrently
        fi
        npm run dev:full
        ;;
    *)
        echo -e "${RED}❌ Geçersiz seçim! 1 veya 2 seçiniz.${NC}"
        exit 1
        ;;
esac
