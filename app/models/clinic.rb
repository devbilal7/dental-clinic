class Clinic < ApplicationRecord
    has_one :staff_info
    belongs_to :user 
    has_many :patients
    has_many :clinic_ips
    has_many :dentist_aggregations
    enum region: {
                    全国: "全国",北海道: "北海道", 青森: "青森", 岩手: "岩手", 宮城: "宮城", 秋田: "秋田",
                    山形: "山形", 福島: "福島", 茨城: "茨城", 栃木: "栃木", 
                    群馬: "群馬", 埼玉: "埼玉", 千葉: "千葉", 東京: "東京", 神奈川: "神奈川",
                    新潟: "新潟", 富山: "富山", 石川: "石川", 福井: "福井", 山梨: "山梨",
                    長野: "長野", 岐阜: "岐阜", 静岡: "静岡", 愛知: "愛知", 三重: "三重", 滋賀: "滋賀",
                    京都: "京都", 大阪: "大阪", 兵庫: "兵庫", 奈良: "奈良", 和歌山: "和歌山", 鳥取: "鳥取",
                    島根: "島根", 岡山: "岡山", 広島: "広島", 山口: "山口", 徳島: "徳島",
                    香川: "香川", 愛媛: "愛媛", 高知: "高知", 福岡: "福岡", 佐賀: "佐賀", 長崎: "長崎",
                    熊本: "熊本", 大分: "大分" , 宮崎: "宮崎", 鹿児島: "鹿児島", 沖縄: "沖縄" 
                }
    # validates :name,:postal_code, :region, :address, :municipalities, :building_name, :floors, :fax_number, :phone_number, presence: true
end
